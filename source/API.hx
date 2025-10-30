package;

import haxe.macro.Compiler;

/**
 * Rename this file to API.hx to fix compile!
 */
class API
{
	// also supports NG_API and NG_ENC -D defines (used for github action)
	public static inline final ngapi:String = #if NG_API Compiler.getDefine("NG_API") #else "" #end;
	public static inline final ngenc:String = #if NG_ENC Compiler.getDefine("NG_ENC") #else "" #end;

	static function main()
	{
		#if sys
		// if API.hx doesn't exist.. make it using this file!
		if (sys.FileSystem.exists("./source/API.hx"))
		{
			trace("API.hx already exists!");
			return;
		}
		trace("Making API.hx at /source/API.hx");
		var filecontent:String = sys.io.File.getContent("./source/API.hx");
		filecontent = StringTools.replace(filecontent, "package", "package");
		filecontent = StringTools.replace(filecontent, "API", "API");
		sys.io.File.saveContent("./source/API.hx", filecontent);
		#end
	}
}