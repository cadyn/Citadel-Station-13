//#define TESTING //By using the testing("message") proc you can create debug-feedback for people with this
								//uncommented, but not visible in the release version)

//#define DATUMVAR_DEBUGGING_MODE //Enables the ability to cache datum vars and retrieve later for debugging which vars changed.

// Comment this out if you are debugging problems that might be obscured by custom error handling in world/Error
#ifdef DEBUG
#define USE_CUSTOM_ERROR_HANDLER
#endif

#ifdef TESTING
#define DATUMVAR_DEBUGGING_MODE

///Used to find the sources of harddels, quite laggy, don't be surpised if it freezes your client for a good while
//#define REFERENCE_TRACKING
#ifdef REFERENCE_TRACKING

///alternate to reftracking, extool variant
//#define EXTOOLS_REFERENCE_TRACKING

///Should we be logging our findings or not
#define REFERENCE_TRACKING_LOG

///Used for doing dry runs of the reference finder, to test for feature completeness
//#define REFERENCE_TRACKING_DEBUG

///Run a lookup on things hard deleting by default.
//#define GC_FAILURE_HARD_LOOKUP
#ifdef GC_FAILURE_HARD_LOOKUP
#define FIND_REF_NO_CHECK_TICK
#endif //ifdef GC_FAILURE_HARD_LOOKUP

#endif //ifdef REFERENCE_TRACKING

/*
* Enables debug messages for every single reaction step. This is 1 message per 0.5s for a SINGLE reaction. Useful for tracking down bugs/asking me for help in the main reaction handiler (equilibrium.dm).
*
* * Requires TESTING to be defined to work.
*/
//#define REAGENTS_TESTING

// #define VISUALIZE_ACTIVE_TURFS //Highlights atmos active turfs in green
// #define TRACK_MAX_SHARE //Allows max share tracking, for use in the atmos debugging ui
#endif //ifdef TESTING

//#define UNIT_TESTS //If this is uncommented, we do a single run though of the game setup and tear down process with unit tests in between

// If this is uncommented, will attempt to load and initialize prof.dll/libprof.so.
// We do not ship byond-tracy. Build it yourself here: https://github.com/mafemergency/byond-tracy/
//#define USE_BYOND_TRACY

#ifndef PRELOAD_RSC //set to:
#define PRELOAD_RSC 2 // 0 to allow using external resources or on-demand behaviour;
#endif // 1 to use the default behaviour;
								// 2 for preloading absolutely everything;

#ifdef LOWMEMORYMODE
#define FORCE_MAP "_maps/runtimestation.json"
#endif

//Additional code for the above flags.
#ifdef TESTING
#warn compiling in TESTING mode. testing() debug messages will be visible.
#endif

#ifdef CIBUILDING
#define UNIT_TESTS
#endif

#ifdef CITESTING
#define TESTING
#endif

#if defined(UNIT_TESTS)
//Hard del testing defines
#define REFERENCE_TRACKING
#define REFERENCE_TRACKING_DEBUG
#define FIND_REF_NO_CHECK_TICK
#endif

#ifdef TGS
// TGS performs its own build of dm.exe, but includes a prepended TGS define.
#define CBT
#endif

#if !defined(CBT) && !defined(SPACEMAN_DMM)
#warn Building with Dream Maker is no longer supported and will result in errors.
#warn In order to build, run BUILD.bat in the root directory.
#warn Consider switching to VSCode editor instead, where you can press Ctrl+Shift+B to build.
#endif
