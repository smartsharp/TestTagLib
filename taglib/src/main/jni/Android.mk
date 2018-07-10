LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE        := taglib
LOCAL_SRC_FILES     := TagLibUtilJni.cpp \
    taglib/taglib/tag.cpp \
    taglib/taglib/tagunion.cpp \
    taglib/taglib/fileref.cpp \
    taglib/taglib/audioproperties.cpp \
    taglib/taglib/tagutils.cpp \
    \
    taglib/taglib/mpeg/mpegfile.cpp \
    taglib/taglib/mpeg/mpegproperties.cpp \
    taglib/taglib/mpeg/mpegheader.cpp \
    taglib/taglib/mpeg/xingheader.cpp \
    \
    taglib/taglib/mpeg/id3v1/id3v1tag.cpp \
    taglib/taglib/mpeg/id3v1/id3v1genres.cpp \
    \
    taglib/taglib/mpeg/id3v2/id3v2framefactory.cpp \
    taglib/taglib/mpeg/id3v2/id3v2synchdata.cpp \
    taglib/taglib/mpeg/id3v2/id3v2tag.cpp \
    taglib/taglib/mpeg/id3v2/id3v2header.cpp \
    taglib/taglib/mpeg/id3v2/id3v2frame.cpp \
    taglib/taglib/mpeg/id3v2/id3v2footer.cpp \
    taglib/taglib/mpeg/id3v2/id3v2extendedheader.cpp \
    \
    taglib/taglib/mpeg/id3v2/frames/attachedpictureframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/commentsframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/eventtimingcodesframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/generalencapsulatedobjectframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/ownershipframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/popularimeterframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/privateframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/relativevolumeframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/synchronizedlyricsframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/textidentificationframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/uniquefileidentifierframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/unknownframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/unsynchronizedlyricsframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/urllinkframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/chapterframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/tableofcontentsframe.cpp \
    taglib/taglib/mpeg/id3v2/frames/podcastframe.cpp \
    \
    taglib/taglib/ogg/oggfile.cpp \
    taglib/taglib/ogg/oggpage.cpp \
    taglib/taglib/ogg/oggpageheader.cpp \
    taglib/taglib/ogg/xiphcomment.cpp \
    \
    taglib/taglib/ogg/vorbis/vorbisfile.cpp \
    taglib/taglib/ogg/vorbis/vorbisproperties.cpp \
    \
    taglib/taglib/flac/flacfile.cpp \
    taglib/taglib/flac/flacpicture.cpp \
    taglib/taglib/flac/flacproperties.cpp \
    taglib/taglib/flac/flacmetadatablock.cpp \
    taglib/taglib/flac/flacunknownmetadatablock.cpp \
    \
    taglib/taglib/ogg/flac/oggflacfile.cpp \
    \
    taglib/taglib/mpc/mpcfile.cpp \
    taglib/taglib/mpc/mpcproperties.cpp \
    \
    taglib/taglib/mp4/mp4file.cpp \
    taglib/taglib/mp4/mp4atom.cpp \
    taglib/taglib/mp4/mp4tag.cpp \
    taglib/taglib/mp4/mp4item.cpp \
    taglib/taglib/mp4/mp4properties.cpp \
    taglib/taglib/mp4/mp4coverart.cpp \
    \
    taglib/taglib/ape/apetag.cpp \
    taglib/taglib/ape/apefooter.cpp \
    taglib/taglib/ape/apeitem.cpp \
    taglib/taglib/ape/apefile.cpp \
    taglib/taglib/ape/apeproperties.cpp \
    \
    taglib/taglib/wavpack/wavpackfile.cpp \
    taglib/taglib/wavpack/wavpackproperties.cpp \
    \
    taglib/taglib/ogg/speex/speexfile.cpp \
    taglib/taglib/ogg/speex/speexproperties.cpp \
    \
    taglib/taglib/ogg/opus/opusfile.cpp \
    taglib/taglib/ogg/opus/opusproperties.cpp \
    \
    taglib/taglib/trueaudio/trueaudiofile.cpp \
    taglib/taglib/trueaudio/trueaudioproperties.cpp \
    \
    taglib/taglib/asf/asftag.cpp \
    taglib/taglib/asf/asffile.cpp \
    taglib/taglib/asf/asfproperties.cpp \
    taglib/taglib/asf/asfattribute.cpp \
    taglib/taglib/asf/asfpicture.cpp \
    \
    taglib/taglib/riff/rifffile.cpp \
    taglib/taglib/riff/aiff/aifffile.cpp \
    taglib/taglib/riff/aiff/aiffproperties.cpp \
    taglib/taglib/riff/wav/wavfile.cpp \
    taglib/taglib/riff/wav/wavproperties.cpp \
    taglib/taglib/riff/wav/infotag.cpp \
    \
    taglib/taglib/mod/modfilebase.cpp \
    taglib/taglib/mod/modfile.cpp \
    taglib/taglib/mod/modtag.cpp \
    taglib/taglib/mod/modproperties.cpp \
    \
    taglib/taglib/s3m/s3mfile.cpp \
    taglib/taglib/s3m/s3mproperties.cpp \
    \
    taglib/taglib/it/itfile.cpp \
    taglib/taglib/it/itproperties.cpp \
    \
    taglib/taglib/xm/xmfile.cpp \
    taglib/taglib/xm/xmproperties.cpp \
    \
    taglib/taglib/toolkit/tstring.cpp \
    taglib/taglib/toolkit/tstringlist.cpp \
    taglib/taglib/toolkit/tbytevector.cpp \
    taglib/taglib/toolkit/tbytevectorlist.cpp \
    taglib/taglib/toolkit/tbytevectorstream.cpp \
    taglib/taglib/toolkit/tiostream.cpp \
    taglib/taglib/toolkit/tfile.cpp \
    taglib/taglib/toolkit/tfilestream.cpp \
    taglib/taglib/toolkit/tdebug.cpp \
    taglib/taglib/toolkit/tpropertymap.cpp \
    taglib/taglib/toolkit/trefcounter.cpp \
    taglib/taglib/toolkit/tdebuglistener.cpp \
    taglib/taglib/toolkit/tzlib.cpp \
    taglib/taglib/toolkit/unicode.cpp



LOCAL_LDLIBS    +=  -lm -llog -lz
LOCAL_CFLAGS	:=  -DHAVE_CONFIG_H
LOCAL_CFLAGS  += -std=c++11  #-D__cplusplus=201300L
LOCAL_CPPFLAGS  :=  -fexceptions  -frtti 
# below for iconv support
LOCAL_STATIC_LIBRARIES :=  
LOCAL_C_INCLUDES	:= 	$(LOCAL_PATH)/ \
                        $(LOCAL_PATH)/taglib/ \
                        $(LOCAL_PATH)/taglib/taglib/ \
						$(LOCAL_PATH)/taglib/taglib/mpeg/ \
						$(LOCAL_PATH)/taglib/taglib/mpeg/id3v1/ \
						$(LOCAL_PATH)/taglib/taglib/mpeg/id3v2/ \
						$(LOCAL_PATH)/taglib/taglib/mpeg/id3v2/frames/ \
						$(LOCAL_PATH)/taglib/taglib/ogg/ \
						$(LOCAL_PATH)/taglib/taglib/ogg/vorbis/ \
						$(LOCAL_PATH)/taglib/taglib/flac/ \
						$(LOCAL_PATH)/taglib/taglib/ogg/flac/ \
						$(LOCAL_PATH)/taglib/taglib/mpc/ \
						$(LOCAL_PATH)/taglib/taglib/mp4/ \
						$(LOCAL_PATH)/taglib/taglib/ape/ \
						$(LOCAL_PATH)/taglib/taglib/wavpack/ \
						$(LOCAL_PATH)/taglib/taglib/ogg/speex/ \
						$(LOCAL_PATH)/taglib/taglib/ogg/opus/ \
                        $(LOCAL_PATH)/taglib/taglib/trueaudio/ \
                        $(LOCAL_PATH)/taglib/taglib/asf/ \
                        $(LOCAL_PATH)/taglib/taglib/riff/ \
                        $(LOCAL_PATH)/taglib/taglib/riff/aiff/ \
                        $(LOCAL_PATH)/taglib/taglib/riff/wav/ \
                        $(LOCAL_PATH)/taglib/taglib/mod/ \
                        $(LOCAL_PATH)/taglib/taglib/s3m/ \
                        $(LOCAL_PATH)/taglib/taglib/it/ \
                        $(LOCAL_PATH)/taglib/taglib/xm/ \
                        $(LOCAL_PATH)/taglib/taglib/toolkit/




include $(BUILD_SHARED_LIBRARY)
