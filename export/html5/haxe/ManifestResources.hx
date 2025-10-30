package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizei199y4:typey4:TEXTy2:idR1y7:preloadtgoR0y33:assets%2Fdata%2Fnokia%2Fnokia.fntR2i11000R3R4R5R7R6tgoR0y33:assets%2Fdata%2Fnokia%2Fnokia.pngR2i1643R3y5:IMAGER5R8R6tgoR0y24:assets%2Fimages%2Fac.pngR2i180R3R9R5R10R6tgoR0y28:assets%2Fimages%2Faccess.pngR2i207R3R9R5R11R6tgoR0y30:assets%2Fimages%2Fantenna0.pngR2i385R3R9R5R12R6tgoR0y30:assets%2Fimages%2Fantenna1.pngR2i259R3R9R5R13R6tgoR0y30:assets%2Fimages%2Fantenna2.pngR2i204R3R9R5R14R6tgoR0y30:assets%2Fimages%2Fantenna3.pngR2i206R3R9R5R15R6tgoR0y30:assets%2Fimages%2Fantenna4.pngR2i229R3R9R5R16R6tgoR0y30:assets%2Fimages%2Fantenna5.pngR2i195R3R9R5R17R6tgoR0y30:assets%2Fimages%2Fantenna6.pngR2i267R3R9R5R18R6tgoR0y32:assets%2Fimages%2Fbackground.pngR2i810R3R9R5R19R6tgoR0y27:assets%2Fimages%2Fblock.pngR2i132R3R9R5R20R6tgoR0y26:assets%2Fimages%2Fbomb.pngR2i471R3R9R5R21R6tgoR0y28:assets%2Fimages%2Fcracks.pngR2i308R3R9R5R22R6tgoR0y28:assets%2Fimages%2Fcrane1.pngR2i419R3R9R5R23R6tgoR0y28:assets%2Fimages%2Fcrane2.pngR2i335R3R9R5R24R6tgoR0y28:assets%2Fimages%2Fcrane3.pngR2i330R3R9R5R25R6tgoR0y28:assets%2Fimages%2Fcrane4.pngR2i399R3R9R5R26R6tgoR0y28:assets%2Fimages%2Fcrane5.pngR2i400R3R9R5R27R6tgoR0y28:assets%2Fimages%2Fcursor.pngR2i179R3R9R5R28R6tgoR0y31:assets%2Fimages%2Fdemo_gibs.pngR2i408R3R9R5R29R6tgoR0y27:assets%2Fimages%2Fdoors.pngR2i185R3R9R5R30R6tgoR0y26:assets%2Fimages%2Fdove.pngR2i205R3R9R5R31R6tgoR0y28:assets%2Fimages%2Fescape.pngR2i194R3R9R5R32R6tgoR0y27:assets%2Fimages%2Ffence.pngR2i193R3R9R5R33R6tgoR0y28:assets%2Fimages%2Ffloor1.pngR2i219R3R9R5R34R6tgoR0y28:assets%2Fimages%2Ffloor2.pngR2i217R3R9R5R35R6tgoR0y30:assets%2Fimages%2Fgameicon.svgR2i4568R3R4R5R36R6tgoR0y30:assets%2Fimages%2Fgameover.pngR2i7294R3R9R5R37R6tgoR0y28:assets%2Fimages%2Fgirder.pngR2i475R3R9R5R38R6tgoR0y29:assets%2Fimages%2Fgirder2.pngR2i226R3R9R5R39R6tgoR0y27:assets%2Fimages%2Fhall1.pngR2i186R3R9R5R40R6tgoR0y27:assets%2Fimages%2Fhall2.pngR2i168R3R9R5R41R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R42R6tgoR0y25:assets%2Fimages%2Fjet.pngR2i1092R3R9R5R43R6tgoR0y32:assets%2Fimages%2Fmidground1.pngR2i906R3R9R5R44R6tgoR0y32:assets%2Fimages%2Fmidground2.pngR2i1062R3R9R5R45R6tgoR0y32:assets%2Fimages%2Fmothership.pngR2i419R3R9R5R46R6tgoR0y31:assets%2Fimages%2Fobstacles.pngR2i287R3R9R5R47R6tgoR0y32:assets%2Fimages%2Fobstacles2.pngR2i232R3R9R5R48R6tgoR0y34:assets%2Fimages%2Fpanel_github.pngR2i141R3R9R5R49R6tgoR0y41:assets%2Fimages%2Fpanel_support_finji.pngR2i233R3R9R5R50R6tgoR0y27:assets%2Fimages%2Fpipe1.pngR2i202R3R9R5R51R6tgoR0y27:assets%2Fimages%2Fpipe2.pngR2i226R3R9R5R52R6tgoR0y28:assets%2Fimages%2Fplayer.pngR2i1231R3R9R5R53R6tgoR0y31:assets%2Fimages%2Fpoweredby.pngR2i210R3R9R5R54R6tgoR0y31:assets%2Fimages%2Freservoir.pngR2i361R3R9R5R55R6tgoR0y27:assets%2Fimages%2Froof1.pngR2i204R3R9R5R56R6tgoR0y27:assets%2Fimages%2Froof2.pngR2i246R3R9R5R57R6tgoR0y27:assets%2Fimages%2Froof3.pngR2i239R3R9R5R58R6tgoR0y27:assets%2Fimages%2Froof4.pngR2i234R3R9R5R59R6tgoR0y27:assets%2Fimages%2Froof5.pngR2i215R3R9R5R60R6tgoR0y30:assets%2Fimages%2Fskylight.pngR2i244R3R9R5R61R6tgoR0y27:assets%2Fimages%2Fslope.pngR2i226R3R9R5R62R6tgoR0y27:assets%2Fimages%2Fsmoke.pngR2i181R3R9R5R63R6tgoR0y27:assets%2Fimages%2Ftitle.pngR2i1233R3R9R5R64R6tgoR0y28:assets%2Fimages%2Ftitle2.pngR2i746R3R9R5R65R6tgoR0y28:assets%2Fimages%2Ftitle3.pngR2i435R3R9R5R66R6tgoR0y28:assets%2Fimages%2Fwalker.pngR2i2458R3R9R5R67R6tgoR0y27:assets%2Fimages%2Fwall1.pngR2i165R3R9R5R68R6tgoR0y27:assets%2Fimages%2Fwall2.pngR2i182R3R9R5R69R6tgoR0y27:assets%2Fimages%2Fwall3.pngR2i226R3R9R5R70R6tgoR0y27:assets%2Fimages%2Fwall4.pngR2i178R3R9R5R71R6tgoR0y29:assets%2Fimages%2Fwindow1.pngR2i167R3R9R5R72R6tgoR0y29:assets%2Fimages%2Fwindow2.pngR2i153R3R9R5R73R6tgoR0y29:assets%2Fimages%2Fwindow3.pngR2i163R3R9R5R74R6tgoR0y29:assets%2Fimages%2Fwindow4.pngR2i170R3R9R5R75R6tgoR2i2144130R3y5:MUSICR5y24:assets%2Fmusic%2Frun.mp3y9:pathGroupaR77hR6tgoR2i506984R3R76R5y26:assets%2Fmusic%2Ftitle.mp3R78aR79hR6tgoR2i26330R3R76R5y34:assets%2Fsounds%2Fbomb_explode.mp3R78aR80y34:assets%2Fsounds%2Fbomb_explode.ogghR6tgoR2i42470R3y5:SOUNDR5R81R78aR80R81hgoR2i81919R3R76R5y30:assets%2Fsounds%2Fbomb_hit.mp3R78aR83y30:assets%2Fsounds%2Fbomb_hit.ogghR6tgoR2i98990R3R82R5R84R78aR83R84hgoR2i81963R3R76R5y33:assets%2Fsounds%2Fbomb_launch.mp3R78aR85y33:assets%2Fsounds%2Fbomb_launch.ogghR6tgoR2i99158R3R82R5R86R78aR85R86hgoR2i81960R3R76R5y30:assets%2Fsounds%2Fbomb_pre.mp3R78aR87y30:assets%2Fsounds%2Fbomb_pre.ogghR6tgoR2i99170R3R82R5R88R78aR87R88hgoR2i50194R3R76R5y29:assets%2Fsounds%2Fcrumble.mp3R78aR89y29:assets%2Fsounds%2Fcrumble.ogghR6tgoR2i66976R3R82R5R90R78aR89R90hgoR2i7978R3R76R5y27:assets%2Fsounds%2Fflap1.mp3R78aR91y27:assets%2Fsounds%2Fflap1.ogghR6tgoR2i24069R3R82R5R92R78aR91R92hgoR2i8814R3R76R5y27:assets%2Fsounds%2Fflap2.mp3R78aR93y27:assets%2Fsounds%2Fflap2.ogghR6tgoR2i24816R3R82R5R94R78aR93R94hgoR2i11321R3R76R5y27:assets%2Fsounds%2Fflap3.mp3R78aR95y27:assets%2Fsounds%2Fflap3.ogghR6tgoR2i27344R3R82R5R96R78aR95R96hgoR2i81957R3R76R5y27:assets%2Fsounds%2Fflyby.mp3R78aR97y27:assets%2Fsounds%2Fflyby.ogghR6tgoR2i99182R3R82R5R98R78aR97R98hgoR2i3381R3R76R5y27:assets%2Fsounds%2Ffoot1.mp3R78aR99y27:assets%2Fsounds%2Ffoot1.ogghR6tgoR2i19468R3R82R5R100R78aR99R100hgoR2i2963R3R76R5y27:assets%2Fsounds%2Ffoot2.mp3R78aR101y27:assets%2Fsounds%2Ffoot2.ogghR6tgoR2i18955R3R82R5R102R78aR101R102hgoR2i2963R3R76R5y27:assets%2Fsounds%2Ffoot3.mp3R78aR103y27:assets%2Fsounds%2Ffoot3.ogghR6tgoR2i19093R3R82R5R104R78aR103R104hgoR2i3381R3R76R5y27:assets%2Fsounds%2Ffoot4.mp3R78aR105y27:assets%2Fsounds%2Ffoot4.ogghR6tgoR2i19419R3R82R5R106R78aR105R106hgoR2i5890R3R76R5y28:assets%2Fsounds%2Ffootc1.mp3R78aR107y28:assets%2Fsounds%2Ffootc1.ogghR6tgoR2i21855R3R82R5R108R78aR107R108hgoR2i6726R3R76R5y28:assets%2Fsounds%2Ffootc2.mp3R78aR109y28:assets%2Fsounds%2Ffootc2.ogghR6tgoR2i22914R3R82R5R110R78aR109R110hgoR2i5472R3R76R5y28:assets%2Fsounds%2Ffootc3.mp3R78aR111y28:assets%2Fsounds%2Ffootc3.ogghR6tgoR2i21386R3R82R5R112R78aR111R112hgoR2i6308R3R76R5y28:assets%2Fsounds%2Ffootc4.mp3R78aR113y28:assets%2Fsounds%2Ffootc4.ogghR6tgoR2i22229R3R82R5R114R78aR113R114hgoR2i7144R3R76R5y28:assets%2Fsounds%2Fglass1.mp3R78aR115y28:assets%2Fsounds%2Fglass1.ogghR6tgoR2i23202R3R82R5R116R78aR115R116hgoR2i5890R3R76R5y28:assets%2Fsounds%2Fglass2.mp3R78aR117y28:assets%2Fsounds%2Fglass2.ogghR6tgoR2i21481R3R82R5R118R78aR117R118hgoR2i6725R3R76R5y27:assets%2Fsounds%2Fjump1.mp3R78aR119y27:assets%2Fsounds%2Fjump1.ogghR6tgoR2i22814R3R82R5R120R78aR119R120hgoR2i4217R3R76R5y27:assets%2Fsounds%2Fjump2.mp3R78aR121y27:assets%2Fsounds%2Fjump2.ogghR6tgoR2i20168R3R82R5R122R78aR121R122hgoR2i4635R3R76R5y27:assets%2Fsounds%2Fjump3.mp3R78aR123y27:assets%2Fsounds%2Fjump3.ogghR6tgoR2i20542R3R82R5R124R78aR123R124hgoR2i15924R3R76R5y31:assets%2Fsounds%2Fobstacle1.mp3R78aR125y31:assets%2Fsounds%2Fobstacle1.ogghR6tgoR2i32046R3R82R5R126R78aR125R126hgoR2i12998R3R76R5y31:assets%2Fsounds%2Fobstacle2.mp3R78aR127y31:assets%2Fsounds%2Fobstacle2.ogghR6tgoR2i29206R3R82R5R128R78aR127R128hgoR2i11744R3R76R5y31:assets%2Fsounds%2Fobstacle3.mp3R78aR129y31:assets%2Fsounds%2Fobstacle3.ogghR6tgoR2i28049R3R82R5R130R78aR129R130hgoR2i530776R3R82R5y27:assets%2Fsounds%2Ftitle.oggR78aR131hR6tgoR2i15085R3R76R5y28:assets%2Fsounds%2Ftumble.mp3R78aR132y28:assets%2Fsounds%2Ftumble.ogghR6tgoR2i31095R3R82R5R133R78aR132R133hgoR2i5470R3R76R5y26:assets%2Fsounds%2Fwall.mp3R78aR134y26:assets%2Fsounds%2Fwall.ogghR6tgoR2i21526R3R82R5R135R78aR134R135hgoR2i15922R3R76R5y29:assets%2Fsounds%2Fwindow1.mp3R78aR136y29:assets%2Fsounds%2Fwindow1.ogghR6tgoR2i32111R3R82R5R137R78aR136R137hgoR2i81960R3R76R5y29:assets%2Fsounds%2Fwindow2.mp3R78aR138y29:assets%2Fsounds%2Fwindow2.ogghR6tgoR2i99122R3R82R5R139R78aR138R139hgoR2i8220R3R76R5y26:flixel%2Fsounds%2Fbeep.mp3R78aR140y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R76R5y28:flixel%2Fsounds%2Fflixel.mp3R78aR142y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i6840R3R82R5R141R78aR140R141hgoR2i33629R3R82R5R143R78aR142R143hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R144R145y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R9R5R150R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R9R5R151R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_nokia_nokia_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_nokia_nokia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ac_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_access_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_antenna6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_block_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bomb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cracks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_crane1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_crane2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_crane3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_crane4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_crane5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_demo_gibs_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_doors_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dove_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_escape_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fence_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_floor1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_floor2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gameicon_svg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_girder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_girder2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_hall1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_hall2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_jet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_midground1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_midground2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mothership_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_obstacles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_obstacles2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_panel_github_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_panel_support_finji_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pipe1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pipe2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_poweredby_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_reservoir_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_roof1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_roof2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_roof3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_roof4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_roof5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_skylight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_slope_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_smoke_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_walker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_wall1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_wall2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_wall3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_wall4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_window1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_window2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_window3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_window4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_run_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_title_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_explode_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_explode_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_hit_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_hit_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_launch_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_launch_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_pre_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_pre_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_crumble_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_crumble_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flap1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flap1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flap2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flap2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flap3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flap3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flyby_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_flyby_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_foot4_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc4_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_footc4_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_glass1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_glass1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_glass2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_glass2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle3_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle3_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_title_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tumble_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_tumble_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_wall_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_wall_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_window1_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_window1_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_window2_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_window2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/nokia/nokia.fnt") @:noCompletion #if display private #end class __ASSET__assets_data_nokia_nokia_fnt extends haxe.io.Bytes {}
@:keep @:image("assets/data/nokia/nokia.png") @:noCompletion #if display private #end class __ASSET__assets_data_nokia_nokia_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ac.png") @:noCompletion #if display private #end class __ASSET__assets_images_ac_png extends lime.graphics.Image {}
@:keep @:image("assets/images/access.png") @:noCompletion #if display private #end class __ASSET__assets_images_access_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna0.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna1.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna2.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna3.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna4.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna5.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/antenna6.png") @:noCompletion #if display private #end class __ASSET__assets_images_antenna6_png extends lime.graphics.Image {}
@:keep @:image("assets/images/background.png") @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends lime.graphics.Image {}
@:keep @:image("assets/images/block.png") @:noCompletion #if display private #end class __ASSET__assets_images_block_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bomb.png") @:noCompletion #if display private #end class __ASSET__assets_images_bomb_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cracks.png") @:noCompletion #if display private #end class __ASSET__assets_images_cracks_png extends lime.graphics.Image {}
@:keep @:image("assets/images/crane1.png") @:noCompletion #if display private #end class __ASSET__assets_images_crane1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/crane2.png") @:noCompletion #if display private #end class __ASSET__assets_images_crane2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/crane3.png") @:noCompletion #if display private #end class __ASSET__assets_images_crane3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/crane4.png") @:noCompletion #if display private #end class __ASSET__assets_images_crane4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/crane5.png") @:noCompletion #if display private #end class __ASSET__assets_images_crane5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/demo_gibs.png") @:noCompletion #if display private #end class __ASSET__assets_images_demo_gibs_png extends lime.graphics.Image {}
@:keep @:image("assets/images/doors.png") @:noCompletion #if display private #end class __ASSET__assets_images_doors_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dove.png") @:noCompletion #if display private #end class __ASSET__assets_images_dove_png extends lime.graphics.Image {}
@:keep @:image("assets/images/escape.png") @:noCompletion #if display private #end class __ASSET__assets_images_escape_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fence.png") @:noCompletion #if display private #end class __ASSET__assets_images_fence_png extends lime.graphics.Image {}
@:keep @:image("assets/images/floor1.png") @:noCompletion #if display private #end class __ASSET__assets_images_floor1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/floor2.png") @:noCompletion #if display private #end class __ASSET__assets_images_floor2_png extends lime.graphics.Image {}
@:keep @:file("assets/images/gameicon.svg") @:noCompletion #if display private #end class __ASSET__assets_images_gameicon_svg extends haxe.io.Bytes {}
@:keep @:image("assets/images/gameover.png") @:noCompletion #if display private #end class __ASSET__assets_images_gameover_png extends lime.graphics.Image {}
@:keep @:image("assets/images/girder.png") @:noCompletion #if display private #end class __ASSET__assets_images_girder_png extends lime.graphics.Image {}
@:keep @:image("assets/images/girder2.png") @:noCompletion #if display private #end class __ASSET__assets_images_girder2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/hall1.png") @:noCompletion #if display private #end class __ASSET__assets_images_hall1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/hall2.png") @:noCompletion #if display private #end class __ASSET__assets_images_hall2_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/jet.png") @:noCompletion #if display private #end class __ASSET__assets_images_jet_png extends lime.graphics.Image {}
@:keep @:image("assets/images/midground1.png") @:noCompletion #if display private #end class __ASSET__assets_images_midground1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/midground2.png") @:noCompletion #if display private #end class __ASSET__assets_images_midground2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mothership.png") @:noCompletion #if display private #end class __ASSET__assets_images_mothership_png extends lime.graphics.Image {}
@:keep @:image("assets/images/obstacles.png") @:noCompletion #if display private #end class __ASSET__assets_images_obstacles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/obstacles2.png") @:noCompletion #if display private #end class __ASSET__assets_images_obstacles2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/panel_github.png") @:noCompletion #if display private #end class __ASSET__assets_images_panel_github_png extends lime.graphics.Image {}
@:keep @:image("assets/images/panel_support_finji.png") @:noCompletion #if display private #end class __ASSET__assets_images_panel_support_finji_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pipe1.png") @:noCompletion #if display private #end class __ASSET__assets_images_pipe1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pipe2.png") @:noCompletion #if display private #end class __ASSET__assets_images_pipe2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/poweredby.png") @:noCompletion #if display private #end class __ASSET__assets_images_poweredby_png extends lime.graphics.Image {}
@:keep @:image("assets/images/reservoir.png") @:noCompletion #if display private #end class __ASSET__assets_images_reservoir_png extends lime.graphics.Image {}
@:keep @:image("assets/images/roof1.png") @:noCompletion #if display private #end class __ASSET__assets_images_roof1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/roof2.png") @:noCompletion #if display private #end class __ASSET__assets_images_roof2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/roof3.png") @:noCompletion #if display private #end class __ASSET__assets_images_roof3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/roof4.png") @:noCompletion #if display private #end class __ASSET__assets_images_roof4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/roof5.png") @:noCompletion #if display private #end class __ASSET__assets_images_roof5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/skylight.png") @:noCompletion #if display private #end class __ASSET__assets_images_skylight_png extends lime.graphics.Image {}
@:keep @:image("assets/images/slope.png") @:noCompletion #if display private #end class __ASSET__assets_images_slope_png extends lime.graphics.Image {}
@:keep @:image("assets/images/smoke.png") @:noCompletion #if display private #end class __ASSET__assets_images_smoke_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title2.png") @:noCompletion #if display private #end class __ASSET__assets_images_title2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title3.png") @:noCompletion #if display private #end class __ASSET__assets_images_title3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/walker.png") @:noCompletion #if display private #end class __ASSET__assets_images_walker_png extends lime.graphics.Image {}
@:keep @:image("assets/images/wall1.png") @:noCompletion #if display private #end class __ASSET__assets_images_wall1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/wall2.png") @:noCompletion #if display private #end class __ASSET__assets_images_wall2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/wall3.png") @:noCompletion #if display private #end class __ASSET__assets_images_wall3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/wall4.png") @:noCompletion #if display private #end class __ASSET__assets_images_wall4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/window1.png") @:noCompletion #if display private #end class __ASSET__assets_images_window1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/window2.png") @:noCompletion #if display private #end class __ASSET__assets_images_window2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/window3.png") @:noCompletion #if display private #end class __ASSET__assets_images_window3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/window4.png") @:noCompletion #if display private #end class __ASSET__assets_images_window4_png extends lime.graphics.Image {}
@:keep @:file("assets/music/mp3/run.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_run_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/mp3/title.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_title_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_explode.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_explode_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_explode.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_explode_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_hit.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_hit_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_hit.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_hit_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_launch.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_launch_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_launch.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_launch_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_pre.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_pre_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/bomb_pre.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_bomb_pre_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/crumble.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_crumble_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/crumble.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_crumble_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flap1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_flap1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flap1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_flap1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flap2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_flap2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flap2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_flap2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flap3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_flap3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flap3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_flap3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flyby.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_flyby_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/flyby.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_flyby_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot4.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/foot4.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_foot4_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc4.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc4_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/footc4.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_footc4_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/glass1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_glass1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/glass1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_glass1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/glass2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_glass2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/glass2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_glass2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/jump1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/jump1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/jump2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/jump2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/jump3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/jump3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/obstacle1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/obstacle1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/obstacle2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/obstacle2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle2_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/obstacle3.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle3_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/obstacle3.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_obstacle3_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/title.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_title_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/tumble.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_tumble_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/tumble.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_tumble_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/wall.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_wall_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/wall.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_wall_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/window1.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_window1_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/window1.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_window1_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/window2.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_window2_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/mp3/window2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_window2_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,1,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,1,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end