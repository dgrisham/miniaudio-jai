#module_parameters(ENABLE_AAC := true);

#if OS == {
    // case .MACOS;
    //     #load "macos.jai";

    //     #import "POSIX";
    //     #import "macos";

    //     #load "macos/core_audio.jai";

    // case .WINDOWS;
    //     #import "Windows";

    //     #load "windows.jai";

    case .LINUX;
        #import "POSIX";

        #if ENABLE_AAC
        {
            #library,system,link_always "libm";
            #library,system,link_always "libfdk-aac";
            #library,system,link_always "libavformat";
            #library,system,link_always "libavcodec";
            #library,system,link_always "libavutil";
            #load "fdkaac.jai";
        }
        else
        {
            #load "linux.jai";
        }

    case; #assert(false);
}
