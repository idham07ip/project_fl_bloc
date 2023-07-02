abstract class AppEvents {
  const AppEvents();
}

//event to be triggered
class TriggerAppEvents extends AppEvents {
  //Declare variable
  final int index;

  //triggered
  const TriggerAppEvents(this.index) : super();
}
