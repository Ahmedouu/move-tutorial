module 0x42::SocialNetwork {
  
    use std::vector;

    struct Friends has store, key, drop {
      people: vector<Person>
    }
    struct Person has store, key, drop, copy {
      name: vector<u8>,
      age: u8,
    }
    struct Enemy has store, key, drop, copy {
      name: vector<u8>,
      age: u8,
    }
    
    public fun create_friend(myFriend: Person, friends: &mut Friends): Person {
      let newFriend = Person {
        name: myFriend.name,
        age: myFriend.age
    };
      add_friend(newFriend, friends);
      return newFriend
    }

  
    // Test friend creation 
    #[test]
    fun test_create_friend(){
      let ahmedou = Person {
        name: b"Ahmedou",
        age: 25,
      };

      let friends = Friends {
        people: (vector[ahmedou])
      };
      let createdFriend = create_friend(ahmedou, &mut friends);
      assert!(createdFriend.name == b"Ahmedou", 0);
    }
    //ADD A TEST IF HE IS OVER 18
    #[test]
    fun test_create_and_age_over_18(){
      let ahmedou = Person {
        name: b"Ahmedou",
        age: 25,
      };

      let friends = Friends {
        people: (vector[ahmedou])
      };
      let createdFriend = create_friend(ahmedou, &mut friends);

      assert!(createdFriend.name == b"Ahmedou", 0);
      assert!(createdFriend.age > 18, 0);
    } 
    //REMOVE A FRIEND


    }
