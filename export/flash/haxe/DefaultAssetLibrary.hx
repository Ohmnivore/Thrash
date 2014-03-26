package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/close.png", __ASSET__assets_images_debugger_buttons_close_png);
		type.set ("assets/images/debugger/buttons/close.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/console.png", __ASSET__assets_images_debugger_buttons_console_png);
		type.set ("assets/images/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/drawDebug.png", __ASSET__assets_images_debugger_buttons_drawdebug_png);
		type.set ("assets/images/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/log.png", __ASSET__assets_images_debugger_buttons_log_png);
		type.set ("assets/images/debugger/buttons/log.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/open.png", __ASSET__assets_images_debugger_buttons_open_png);
		type.set ("assets/images/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/pause.png", __ASSET__assets_images_debugger_buttons_pause_png);
		type.set ("assets/images/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/play.png", __ASSET__assets_images_debugger_buttons_play_png);
		type.set ("assets/images/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/record_off.png", __ASSET__assets_images_debugger_buttons_record_off_png);
		type.set ("assets/images/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/record_on.png", __ASSET__assets_images_debugger_buttons_record_on_png);
		type.set ("assets/images/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/restart.png", __ASSET__assets_images_debugger_buttons_restart_png);
		type.set ("assets/images/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/stats.png", __ASSET__assets_images_debugger_buttons_stats_png);
		type.set ("assets/images/debugger/buttons/stats.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/step.png", __ASSET__assets_images_debugger_buttons_step_png);
		type.set ("assets/images/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/stop.png", __ASSET__assets_images_debugger_buttons_stop_png);
		type.set ("assets/images/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/buttons/watch.png", __ASSET__assets_images_debugger_buttons_watch_png);
		type.set ("assets/images/debugger/buttons/watch.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/flixel.png", __ASSET__assets_images_debugger_flixel_png);
		type.set ("assets/images/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/debugger/windowHandle.png", __ASSET__assets_images_debugger_windowhandle_png);
		type.set ("assets/images/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/logo/default.png", __ASSET__assets_images_logo_default_png);
		type.set ("assets/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/logo/HaxeFlixel.svg", __ASSET__assets_images_logo_haxeflixel_svg);
		type.set ("assets/images/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/logo/logo.png", __ASSET__assets_images_logo_logo_png);
		type.set ("assets/images/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/preloader/corners.png", __ASSET__assets_images_preloader_corners_png);
		type.set ("assets/images/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/preloader/light.png", __ASSET__assets_images_preloader_light_png);
		type.set ("assets/images/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/tile/autotiles.png", __ASSET__assets_images_tile_autotiles_png);
		type.set ("assets/images/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/tile/autotiles_alt.png", __ASSET__assets_images_tile_autotiles_alt_png);
		type.set ("assets/images/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/analog/base.png", __ASSET__assets_images_ui_analog_base_png);
		type.set ("assets/images/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/analog/thumb.png", __ASSET__assets_images_ui_analog_thumb_png);
		type.set ("assets/images/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/button.png", __ASSET__assets_images_ui_button_png);
		type.set ("assets/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/cursor.png", __ASSET__assets_images_ui_cursor_png);
		type.set ("assets/images/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/fontData11pt.png", __ASSET__assets_images_ui_fontdata11pt_png);
		type.set ("assets/images/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/a.png", __ASSET__assets_images_ui_virtualpad_a_png);
		type.set ("assets/images/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/b.png", __ASSET__assets_images_ui_virtualpad_b_png);
		type.set ("assets/images/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/c.png", __ASSET__assets_images_ui_virtualpad_c_png);
		type.set ("assets/images/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/down.png", __ASSET__assets_images_ui_virtualpad_down_png);
		type.set ("assets/images/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/left.png", __ASSET__assets_images_ui_virtualpad_left_png);
		type.set ("assets/images/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/right.png", __ASSET__assets_images_ui_virtualpad_right_png);
		type.set ("assets/images/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/up.png", __ASSET__assets_images_ui_virtualpad_up_png);
		type.set ("assets/images/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/x.png", __ASSET__assets_images_ui_virtualpad_x_png);
		type.set ("assets/images/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ui/virtualpad/y.png", __ASSET__assets_images_ui_virtualpad_y_png);
		type.set ("assets/images/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sounds/beep.wav", __ASSET__assets_sounds_beep_wav);
		type.set ("assets/sounds/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/flixel.wav", __ASSET__assets_sounds_flixel_wav);
		type.set ("assets/sounds/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("media/images/agent_run.png", __ASSET__media_images_agent_run_png);
		type.set ("media/images/agent_run.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/agent_run2.png", __ASSET__media_images_agent_run2_png);
		type.set ("media/images/agent_run2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/agent_run3.png", __ASSET__media_images_agent_run3_png);
		type.set ("media/images/agent_run3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/agent_run4.png", __ASSET__media_images_agent_run4_png);
		type.set ("media/images/agent_run4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/agent.spine", __ASSET__media_images_anim_agent_spine);
		type.set ("media/images/anim/agent.spine", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("media/images/anim/arm.png", __ASSET__media_images_anim_arm_png);
		type.set ("media/images/anim/arm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/back_arm.png", __ASSET__media_images_anim_back_arm_png);
		type.set ("media/images/anim/back_arm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/body.png", __ASSET__media_images_anim_body_png);
		type.set ("media/images/anim/body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/foot.png", __ASSET__media_images_anim_foot_png);
		type.set ("media/images/anim/foot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/fore_arm.png", __ASSET__media_images_anim_fore_arm_png);
		type.set ("media/images/anim/fore_arm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/hand.png", __ASSET__media_images_anim_hand_png);
		type.set ("media/images/anim/hand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/head.png", __ASSET__media_images_anim_head_png);
		type.set ("media/images/anim/head.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/quad.png", __ASSET__media_images_anim_quad_png);
		type.set ("media/images/anim/quad.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/anim/tibia.png", __ASSET__media_images_anim_tibia_png);
		type.set ("media/images/anim/tibia.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/gridtiles2.png", __ASSET__media_images_gridtiles2_png);
		type.set ("media/images/gridtiles2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/scan.png", __ASSET__media_images_scan_png);
		type.set ("media/images/scan.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/images/tree.png", __ASSET__media_images_tree_png);
		type.set ("media/images/tree.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("media/lvls/ProjectDef.oep", __ASSET__media_lvls_projectdef_oep);
		type.set ("media/lvls/ProjectDef.oep", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("media/lvls/Test.oel", __ASSET__media_lvls_test_oel);
		type.set ("media/lvls/Test.oel", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("media/lvls/test2.oel", __ASSET__media_lvls_test2_oel);
		type.set ("media/lvls/test2.oel", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("media/splitter.pbj", __ASSET__media_splitter_pbj);
		type.set ("media/splitter.pbj", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/close.png", "assets/images/debugger/buttons/close.png");
		type.set ("assets/images/debugger/buttons/close.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/console.png", "assets/images/debugger/buttons/console.png");
		type.set ("assets/images/debugger/buttons/console.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/drawDebug.png", "assets/images/debugger/buttons/drawDebug.png");
		type.set ("assets/images/debugger/buttons/drawDebug.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/log.png", "assets/images/debugger/buttons/log.png");
		type.set ("assets/images/debugger/buttons/log.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/open.png", "assets/images/debugger/buttons/open.png");
		type.set ("assets/images/debugger/buttons/open.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/pause.png", "assets/images/debugger/buttons/pause.png");
		type.set ("assets/images/debugger/buttons/pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/play.png", "assets/images/debugger/buttons/play.png");
		type.set ("assets/images/debugger/buttons/play.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/record_off.png", "assets/images/debugger/buttons/record_off.png");
		type.set ("assets/images/debugger/buttons/record_off.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/record_on.png", "assets/images/debugger/buttons/record_on.png");
		type.set ("assets/images/debugger/buttons/record_on.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/restart.png", "assets/images/debugger/buttons/restart.png");
		type.set ("assets/images/debugger/buttons/restart.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/stats.png", "assets/images/debugger/buttons/stats.png");
		type.set ("assets/images/debugger/buttons/stats.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/step.png", "assets/images/debugger/buttons/step.png");
		type.set ("assets/images/debugger/buttons/step.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/stop.png", "assets/images/debugger/buttons/stop.png");
		type.set ("assets/images/debugger/buttons/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/buttons/watch.png", "assets/images/debugger/buttons/watch.png");
		type.set ("assets/images/debugger/buttons/watch.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/flixel.png", "assets/images/debugger/flixel.png");
		type.set ("assets/images/debugger/flixel.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/debugger/windowHandle.png", "assets/images/debugger/windowHandle.png");
		type.set ("assets/images/debugger/windowHandle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/images/logo/default.png", "assets/images/logo/default.png");
		type.set ("assets/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/logo/HaxeFlixel.svg", "assets/images/logo/HaxeFlixel.svg");
		type.set ("assets/images/logo/HaxeFlixel.svg", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/images/logo/logo.png", "assets/images/logo/logo.png");
		type.set ("assets/images/logo/logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/preloader/corners.png", "assets/images/preloader/corners.png");
		type.set ("assets/images/preloader/corners.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/preloader/light.png", "assets/images/preloader/light.png");
		type.set ("assets/images/preloader/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/tile/autotiles.png", "assets/images/tile/autotiles.png");
		type.set ("assets/images/tile/autotiles.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/tile/autotiles_alt.png", "assets/images/tile/autotiles_alt.png");
		type.set ("assets/images/tile/autotiles_alt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/analog/base.png", "assets/images/ui/analog/base.png");
		type.set ("assets/images/ui/analog/base.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/analog/thumb.png", "assets/images/ui/analog/thumb.png");
		type.set ("assets/images/ui/analog/thumb.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/button.png", "assets/images/ui/button.png");
		type.set ("assets/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/cursor.png", "assets/images/ui/cursor.png");
		type.set ("assets/images/ui/cursor.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/fontData11pt.png", "assets/images/ui/fontData11pt.png");
		type.set ("assets/images/ui/fontData11pt.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/a.png", "assets/images/ui/virtualpad/a.png");
		type.set ("assets/images/ui/virtualpad/a.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/b.png", "assets/images/ui/virtualpad/b.png");
		type.set ("assets/images/ui/virtualpad/b.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/c.png", "assets/images/ui/virtualpad/c.png");
		type.set ("assets/images/ui/virtualpad/c.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/down.png", "assets/images/ui/virtualpad/down.png");
		type.set ("assets/images/ui/virtualpad/down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/left.png", "assets/images/ui/virtualpad/left.png");
		type.set ("assets/images/ui/virtualpad/left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/right.png", "assets/images/ui/virtualpad/right.png");
		type.set ("assets/images/ui/virtualpad/right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/up.png", "assets/images/ui/virtualpad/up.png");
		type.set ("assets/images/ui/virtualpad/up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/x.png", "assets/images/ui/virtualpad/x.png");
		type.set ("assets/images/ui/virtualpad/x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/images/ui/virtualpad/y.png", "assets/images/ui/virtualpad/y.png");
		type.set ("assets/images/ui/virtualpad/y.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/sounds/beep.wav", "assets/sounds/beep.wav");
		type.set ("assets/sounds/beep.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/flixel.wav", "assets/sounds/flixel.wav");
		type.set ("assets/sounds/flixel.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("media/images/agent_run.png", "media/images/agent_run.png");
		type.set ("media/images/agent_run.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/agent_run2.png", "media/images/agent_run2.png");
		type.set ("media/images/agent_run2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/agent_run3.png", "media/images/agent_run3.png");
		type.set ("media/images/agent_run3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/agent_run4.png", "media/images/agent_run4.png");
		type.set ("media/images/agent_run4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/agent.spine", "media/images/anim/agent.spine");
		type.set ("media/images/anim/agent.spine", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("media/images/anim/arm.png", "media/images/anim/arm.png");
		type.set ("media/images/anim/arm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/back_arm.png", "media/images/anim/back_arm.png");
		type.set ("media/images/anim/back_arm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/body.png", "media/images/anim/body.png");
		type.set ("media/images/anim/body.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/foot.png", "media/images/anim/foot.png");
		type.set ("media/images/anim/foot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/fore_arm.png", "media/images/anim/fore_arm.png");
		type.set ("media/images/anim/fore_arm.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/hand.png", "media/images/anim/hand.png");
		type.set ("media/images/anim/hand.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/head.png", "media/images/anim/head.png");
		type.set ("media/images/anim/head.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/quad.png", "media/images/anim/quad.png");
		type.set ("media/images/anim/quad.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/anim/tibia.png", "media/images/anim/tibia.png");
		type.set ("media/images/anim/tibia.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/gridtiles2.png", "media/images/gridtiles2.png");
		type.set ("media/images/gridtiles2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/scan.png", "media/images/scan.png");
		type.set ("media/images/scan.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/images/tree.png", "media/images/tree.png");
		type.set ("media/images/tree.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("media/lvls/ProjectDef.oep", "media/lvls/ProjectDef.oep");
		type.set ("media/lvls/ProjectDef.oep", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("media/lvls/Test.oel", "media/lvls/Test.oel");
		type.set ("media/lvls/Test.oel", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("media/lvls/test2.oel", "media/lvls/test2.oel");
		type.set ("media/lvls/test2.oel", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("media/splitter.pbj", "media/splitter.pbj");
		type.set ("media/splitter.pbj", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		
		#else
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<AssetData> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							path.set (asset.id, asset.path);
							type.set (asset.id, asset.type);
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest");
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		//return null;		
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }
class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
class __ASSET__assets_images_debugger_buttons_close_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_console_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_drawdebug_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_log_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_open_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_pause_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_play_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_record_off_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_record_on_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_restart_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_stats_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_step_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_stop_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_buttons_watch_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_flixel_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_debugger_windowhandle_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
class __ASSET__assets_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_logo_haxeflixel_svg extends flash.utils.ByteArray { }
class __ASSET__assets_images_logo_logo_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_preloader_corners_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_preloader_light_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_tile_autotiles_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_tile_autotiles_alt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_analog_base_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_analog_thumb_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_fontdata11pt_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_a_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_b_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_c_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_down_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_left_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_right_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_up_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_images_ui_virtualpad_y_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
class __ASSET__assets_sounds_beep_wav extends flash.media.Sound { }
class __ASSET__assets_sounds_flixel_wav extends flash.media.Sound { }
class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
class __ASSET__media_images_agent_run_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_agent_run2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_agent_run3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_agent_run4_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_agent_spine extends flash.utils.ByteArray { }
class __ASSET__media_images_anim_arm_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_back_arm_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_body_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_foot_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_fore_arm_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_hand_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_head_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_quad_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_anim_tibia_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_gridtiles2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_scan_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_images_tree_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__media_lvls_projectdef_oep extends flash.utils.ByteArray { }
class __ASSET__media_lvls_test_oel extends flash.utils.ByteArray { }
class __ASSET__media_lvls_test2_oel extends flash.utils.ByteArray { }
class __ASSET__media_splitter_pbj extends flash.utils.ByteArray { }


#elseif html5


class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }
class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }

































































#end