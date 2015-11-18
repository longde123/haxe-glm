package glm;

/**
 * Utility class for dealing with 3D vectors
 */
abstract Vec4(Array<Float>) {
	/**
	 * Utility accessor for the first element
	 */
	public var x(get, set):Float;
	function get_x():Float {
		return this[0];
	}
	function set_x(v:Float) {
		return this[0] = v;
	}

	/**
	 * Utility accessor for the second element
	 */
	public var y(get, set):Float;
	function get_y():Float {
		return this[1];
	}
	function set_y(v:Float) {
		return this[1] = v;
	}

	/**
	 * Utility accessor for the third element
	 */
	public var z(get, set):Float;
	function get_z():Float {
		return this[2];
	}
	function set_z(v:Float) {
		return this[2] = v;
	}

	/**
	 * Utility accessor for the fourth element
	 */
	public var w(get, set):Float;
	function get_w():Float {
		return this[3];
	}
	function set_w(v:Float) {
		return this[3] = v;
	}

	/**
	 * Utility accessor for the first element
	 */
	public var r(get, set):Float;
	function get_r():Float {
		return this[0];
	}
	function set_r(v:Float) {
		return this[0] = v;
	}


	/**
	 * Utility accessor for the second element
	 */
	public var g(get, set):Float;
	function get_g():Float {
		return this[1];
	}
	function set_g(v:Float) {
		return this[1] = v;
	}
	
	/**
	 * Utility accessor for the third element
	 */
	public var b(get, set):Float;
	function get_b():Float {
		return this[2];
	}
	function set_b(v:Float) {
		return this[2] = v;
	}
	
	/**
	 * Utility accessor for the fourth element
	 */
	public var a(get, set):Float;
	function get_a():Float {
		return this[3];
	}
	function set_a(v:Float) {
		return this[3] = v;
	}

	/**
	 * Utility accessor for the first element
	 */
	public var s(get, set):Float;
	function get_s():Float {
		return this[0];
	}
	function set_s(v:Float) {
		return this[0] = v;
	}

	/**
	 * Utility accessor for the second element
	 */
	public var t(get, set):Float;
	function get_t():Float {
		return this[1];
	}
	function set_t(v:Float) {
		return this[1] = v;
	}

	/**
	 * Utility accessor for the third element
	 */
	public var p(get, set):Float;
	function get_p():Float {
		return this[2];
	}
	function set_p(v:Float) {
		return this[2] = v;
	}

	/**
	 * Utility accessor for the fourth element
	 */
	public var q(get, set):Float;
	function get_q():Float {
		return this[2];
	}
	function set_q(v:Float) {
		return this[3] = v;
	}

	public function new(x:Float=0, y:Float=0, z:Float=0, w:Float=0) {
		var arr:Array<Float> = new Array<Float>();
		arr.push(x);
		arr.push(y);
		arr.push(z);
		arr.push(w);
		this = arr;
	}

	/**
	 * Utility function to set the components
	 */
	public function set(?x:Float, ?y:Float, ?z:Float, ?w:Float):Vec4 {
		if(x != null) this[0] = x;
		if(y != null) this[1] = y;
		if(z != null) this[2] = z;
		if(w != null) this[3] = w;
		return cast this;
	}

	/**
	 * Sets all the values to be 0
	 * @return `this`
	 */
	public function zero():Vec4 {
		this[0] = 0;
		this[1] = 0;
		this[2] = 0;
		this[3] = 0;
		return cast this;
	}

	/**
	 * Calculates the square of the L2-norm of the vector, `sqrt` it to get the length.
	 * @return `x^2 + y^2 + z^2 + w^2`
	 */
	public function sqrLength():Float {
		return (this[0] * this[0]) + (this[1] * this[1]) + (this[2] * this[2]) + (this[3] * this[3]);
	}

	/**
	 * Calculates the L2-norm of the vector
	 * @return The length (magnitude) of the vector
	 */
	public function length():Float {
		return Math.sqrt(sqrLength());
	}

	/**
	 * Normalizes the vector such that its `length == 1` while maintaining direction
	 * @return `this`, normalized
	 */
	public function normalize():Vec4 {
		var l:Float = length();
		if(l != 0) {
			this[0] /= l;
			this[1] /= l;
			this[2] /= l;
			this[3] /= l;
		}
		else {
			zero();
		}
		return cast this;
	}

	/**
	 * Photocopies `this`
	 * @return A new `Vec4` who's elements are the same as `this`
	 */
	public function clone():Vec4 {
		var copy:Vec4 = new Vec4();
		copy[0] = this[0];
		copy[1] = this[1];
		copy[2] = this[2];
		copy[3] = this[3];
		return copy;
	}

	/**
	 * Element-based addition
	 * @param  b The vector to add to `this`
	 * @return   `this.x + b.x`, etc
	 */
	public function add(b:Vec4):Vec4 {
		this[0] += b[0];
		this[1] += b[1];
		this[2] += b[2];
		this[3] += b[3];
		return cast this;
	}

	@:op(A + B)
	public static inline function addVec4Op(a:Vec4, b:Vec4):Vec4 {
		return a.clone().add(b);
	}

	/**
	 * Element-based subtraction
	 * @param  b The vector to subtract from `this`
	 * @return   `this.x - b.x`, etc
	 */
	public function subtract(b:Vec4):Vec4 {
		this[0] -= b[0];
		this[1] -= b[1];
		this[2] -= b[2];
		this[3] -= b[3];
		return cast this;
	}

	public function multiplyScalar(b:Float):Vec4 {
		this[0] *= b;
		this[1] *= b;
		this[2] *= b;
		this[3] *= b;
		return cast this;
	}

	@:op(A * B)
	public static inline function multiplyScalarOp(a:Vec4, b:Float):Vec4 {
		return a.clone().multiplyScalar(b);
	}

	@:op(A * B)
	public static inline function multiplyScalarOp2(b:Float, a:Vec4):Vec4 {
		return a.clone().multiplyScalar(b);
	}

	/**
	 * Provides array access in the form of `vector[i]` where `i ∈ [0, 1, 2]`
	 */
	@:arrayAccess public inline function arrayGet(i:Int):Float {
		return this[i];
	}

	/**
	 * Provides array access in the form of `vector[i] = x` where `i ∈ [0, 1, 2]`
	 */
	@:arrayAccess public inline function arraySet(i:Int, x:Float):Float {
		return this[i] = x;
	}

	public inline function toArray():Array<Float> {
		return this;
	}
}