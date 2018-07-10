#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <jni.h>
#include<android/log.h>


#include <fileref.h>
#include <tag.h>
#include <tpropertymap.h>

#define TAG "TagLib" // 这个是自定义的LOG的标识
#define LOGD(...) __android_log_print(ANDROID_LOG_DEBUG,TAG ,__VA_ARGS__) // 定义LOGD类型
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO,TAG ,__VA_ARGS__) // 定义LOGI类型
#define LOGW(...) __android_log_print(ANDROID_LOG_WARN,TAG ,__VA_ARGS__) // 定义LOGW类型
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR,TAG ,__VA_ARGS__) // 定义LOGE类型
#define LOGF(...) __android_log_print(ANDROID_LOG_FATAL,TAG ,__VA_ARGS__) // 定义LOGF类型

#ifdef __cplusplus
extern "C" {
#endif


JNIEXPORT jstring JNICALL TagLibUtil_getTag(JNIEnv *env, jobject thiz, jstring jfilepath,
                                            jstring jtagtype, jboolean debug){
    const char *filepath = env->GetStringUTFChars(jfilepath, NULL);
    const char *tagtype = env->GetStringUTFChars(jtagtype, NULL);
    LOGD("getTag: filepath=%s, tagtype=%s", filepath, tagtype);
    TagLib::FileRef f(filepath);
    std::string val;
    if(!f.isNull() && f.tag()) {
        if (!strcmp(tagtype, "COMMENT")) {
            TagLib::Tag *tag = f.tag();
            TagLib::String comment = tag->comment();
            if (comment != TagLib::String::null) {
                val = comment.toCString(true);
            }
        } else {
            TagLib::PropertyMap tags = f.file()->properties();
            const TagLib::StringList list = tags[tagtype];
            if (!list.isEmpty()) {
                val = list.front().toCString(true);
            }
        }
    }else {
        LOGD("getTag: tag() failed.");
    }
    env->ReleaseStringUTFChars(jfilepath, filepath);
    env->ReleaseStringUTFChars(jtagtype, tagtype);
    return val.empty()? nullptr: env->NewStringUTF(val.c_str());
}


JNIEXPORT jboolean JNICALL TagLibUtil_setTag(JNIEnv *env, jobject thiz, jstring jfilepath,
                                             jstring jtagtype, jstring jtagid, jstring jtagval, jboolean debug){
    if(jfilepath == NULL || jtagtype == NULL || jtagid == NULL || jtagval == NULL){
        return JNI_FALSE;
    }
    const char *filepath = env->GetStringUTFChars(jfilepath, NULL);
    const char *tagtype = env->GetStringUTFChars(jtagtype, NULL);
    const char *tagid = env->GetStringUTFChars(jtagid, NULL);
    const char *tagval = env->GetStringUTFChars(jtagval, NULL);
    LOGD("setTag: filepath=%s, tagtype=%s, tagid=%s, tagval=%s", filepath, tagtype, tagid, tagval);
    TagLib::FileRef f(filepath);
    std::string val;
    bool ret = false;
    if(!f.isNull() && f.tag()) {
        if (!strcmp(tagtype, "COMMENT")) {
            TagLib::Tag *tag = f.tag();
            TagLib::String comment = tag->comment();
            if (comment != TagLib::String::null) {
                val = comment.toCString(true);
            }
            if (val.empty() || val.find(tagid) == std::string::npos) {
                LOGD("setTag: found comment %s.", val.c_str());
                tag->setComment(TagLib::String(tagval, TagLib::String::Type::UTF8));
                ret = f.file()->save();
                if (!ret) {
                    LOGD("setTag: save file failed.");
                }
            }else {
                LOGD("setTag: tagid already exists.");
                ret = true;
            }
        }else {
            TagLib::PropertyMap tags = f.file()->properties();
            if(tags.contains(tagtype)){
                tags.replace(tagtype, TagLib::String(tagval, TagLib::String::Type::UTF8));
            }else{
                tags.insert(tagtype, TagLib::String(tagval, TagLib::String::Type::UTF8));
            }
            ret = f.file()->save();
            if (!ret) {
                LOGD("setTag: save file failed.");
            }
        }
    }else {
        LOGD("setTag: tag() failed.");
    }
   
   
    env->ReleaseStringUTFChars(jfilepath, filepath);
    env->ReleaseStringUTFChars(jtagtype, tagtype);
    env->ReleaseStringUTFChars(jtagid, tagid);
    env->ReleaseStringUTFChars(jtagval, tagval);
    return ret;
}
static const JNINativeMethod method_table[] = {
        { "getTag", "(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;",
                (void*) TagLibUtil_getTag },
        { "setTag", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z",
                (void*) TagLibUtil_setTag }
};


JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    JNIEnv *pEnv = NULL;
    //获取环境
    jint ret = vm->GetEnv((void**) &pEnv, JNI_VERSION_1_6);
    if (ret != JNI_OK) {
        return -1;
    }
    jclass cls = pEnv->FindClass("org/smartsharp/taglib/TagLibUtil");
    if (cls == NULL) {
        return -1;
    }
    //动态注册本地方法
    ret = pEnv->RegisterNatives(cls, method_table,sizeof(method_table) / sizeof(method_table[0]));
    if (ret != JNI_OK) {
        //__android_log_print(ANDROID_LOG_DEBUG, "__BING__", "jni_replace:FindClass Error");
        return -1;
    }
    //返回java版本
    return JNI_VERSION_1_6;
}
#ifdef __cplusplus
}
#endif
