import 'dart:collection';

// Enum for subscription types
enum SubscriptionType { Gold, Silver, Bronze }

// Class to represent a Member
class Member {
  String name;
  int age;
  SubscriptionType subscriptionType;
  bool feePaid;

  Member(this.name, this.age, this.subscriptionType, this.feePaid);

  void printMemberInfo() {
    print('Name: $name');
    print('Age: $age');
    print('Subscription: $subscriptionType');
    print('Fee Paid: ${feePaid ? 'Yes' : 'No'}');
  }
}

// Class to represent a Class/Session
class GymClass {
  String name;
  DateTime dateTime;
  String instructor;

  GymClass(this.name, this.dateTime, this.instructor);

  void printClassInfo() {
    print('Class Name: $name');
    print('Date and Time: $dateTime');
    print('Instructor: $instructor');
  }
}

// Class to manage the schedule
class Schedule {
  List<GymClass> classes = [];

  void addClass(GymClass gymClass) {
    classes.add(gymClass);
    print('${gymClass.name} has been scheduled for ${gymClass.dateTime}.');
  }

  void removeClass(GymClass gymClass) {
    classes.remove(gymClass);
    print('${gymClass.name} has been removed from the schedule.');
  }

  void printSchedule() {
    print('Class Schedule:');
    for (var gymClass in classes) {
      gymClass.printClassInfo();
    }
  }
}

// Class for Member Management
class MemberManagement {
  List<Member> members = [];

  void registerMember(Member member) {
    members.add(member);
    print('${member.name} has been registered with ${member.subscriptionType} subscription.');
  }

  void printMembers() {
    print('Member List:');
    for (var member in members) {
      member.printMemberInfo();
    }
  }

  Member? findMember(String name) {
    for (var member in members) {
      if (member.name == name) {
        return member;
      }
    }
    return null;
  }
}

void main() {
  // Example usage of the Gym Management System

  // Creating an instance of MemberManagement
  MemberManagement memberManagement = MemberManagement();

  // Registering members
  Member member1 = Member('Amina', 25, SubscriptionType.Gold, true);
  Member member2 = Member('John', 30, SubscriptionType.Silver, false);
  memberManagement.registerMember(member1);
  memberManagement.registerMember(member2);

  // Printing all members
  memberManagement.printMembers();

  // Creating an instance of Schedule
  Schedule schedule = Schedule();

  // Adding classes to the schedule
  GymClass class1 = GymClass('Cardio', DateTime(2024, 5, 17, 10, 0), 'Wambua');
  GymClass class2 = GymClass('Weight Training', DateTime(2024, 5, 18, 11, 0), 'Isaac');
  schedule.addClass(class1);
  schedule.addClass(class2);

  // Printing the schedule
  schedule.printSchedule();
}

