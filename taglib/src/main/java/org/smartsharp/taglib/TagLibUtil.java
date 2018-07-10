package org.smartsharp.taglib;


public class TagLibUtil {
    static {
        System.loadLibrary("taglib");
    }
    /*!
     * This map implements a generic representation of textual audio metadata
     * ("tags") realized as pairs of a case-insensitive key
     * and a nonempty list of corresponding values, each value being an arbitrary
     * unicode String.
     *
     * Note that most metadata formats pose additional conditions on the tag keys. The
     * most popular ones (Vorbis, APE, ID3v2) should support all ASCII only words of
     * length between 2 and 16.
     *
     * This class can contain any tags, but here is a list of "well-known" tags that
     * you might want to use:
     *
     * Basic tags:
     *
     *  - TITLE
     *  - ALBUM
     *  - ARTIST
     *  - ALBUMARTIST
     *  - SUBTITLE
     *  - TRACKNUMBER
     *  - DISCNUMBER
     *  - DATE
     *  - ORIGINALDATE
     *  - GENRE
     *  - COMMENT
     *
     * Sort names:
     *
     *  - TITLESORT
     *  - ALBUMSORT
     *  - ARTISTSORT
     *  - ALBUMARTISTSORT
     *
     * Credits:
     *
     *  - COMPOSER
     *  - LYRICIST
     *  - CONDUCTOR
     *  - REMIXER
     *  - PERFORMER:<XXXX>
     *
     * Other tags:
     *
     *  - ISRC
     *  - ASIN
     *  - BPM
     *  - COPYRIGHT
     *  - ENCODEDBY
     *  - MOOD
     *  - COMMENT
     *  - MEDIA
     *  - LABEL
     *  - CATALOGNUMBER
     *  - BARCODE
     *
     * MusicBrainz identifiers:
     *
     *  - MUSICBRAINZ_TRACKID
     *  - MUSICBRAINZ_ALBUMID
     *  - MUSICBRAINZ_RELEASEGROUPID
     *  - MUSICBRAINZ_WORKID
     *  - MUSICBRAINZ_ARTISTID
     *  - MUSICBRAINZ_ALBUMARTISTID
     *  - ACOUSTID_ID
     *  - ACOUSTID_FINGERPRINT
     *  - MUSICIP_PUID
     *
     */

    public static native String getTag(String inputfile, String tagtype, boolean debug);
    public static native boolean setTag(String inputfile, String tagtype, String tagid, String tagval, boolean debug);
}
