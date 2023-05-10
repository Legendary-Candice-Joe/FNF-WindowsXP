package hxex;

// MA: Map and Array extensions
// Arrays don't have a search function.
// Maps don't have copy functions either.
// So this basically fixes that.

class MAextensions {
	public static function contains(ar:Array<Dynamic>, f:Dynamic):Bool {
		for (i in 0...ar.length) 
			if (ar[i] == f) return true;
			
		return false;
	}
	public inline static function clear(mp:Map<Dynamic, Dynamic>){
		var qR:Array<Dynamic> = [];
		for (a in mp.keys()) qR.push(a);
		for (i in 0...qR.length)
			mp.remove(qR[i]);
	}
	// not a perfect equivilent but sureley helps!
	public inline static function mCopy(src:Map<Dynamic, Dynamic>, dst:Map<Dynamic, Dynamic>){
		for (mpfk in src.keys())
			dst.set(mpfk, src.get(mpfk));
	}
}