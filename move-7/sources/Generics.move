module 0x42::Generics {
  use std::vector;
  use std::debug;
  struct Flexi<T1, T2> has drop {

    x: T1,
    y: vector<T2>
  }

  fun new_felxi(_x: bool, _y: vector<u8>): Flexi<bool, u8> {
    return Flexi{
      x: _x,
      y: _y,
    }
  }
  fun generic_func<HelloType>(t: HelloType): HelloType{
    return t
  }
  fun new_vector<T>(arg: T): vector<T> {
    let vec = vector::empty<T>();
    vector::push_back(&mut vec, arg);
    vec
    }
  #[test]
  fun test_new_flexi(){
    let y = vector<u8>[1, 72, 89, 23];
    let flexi = new_felxi(false, y);
    debug::print(&flexi);

  }

  #[test]

  fun test_generic_func(){
    let vec = vector<bool>[true, true, true, false];
    let thing = generic_func(vec);
    debug::print(&thing)
  }
  #[test]
  fun test_new_vector() {
    let vec = new_vector(true);
    debug::print(&vec)
  }
}
