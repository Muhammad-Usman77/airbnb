class Message {
  final String image;
  final String vendorImage;
  final String name;
  final String date;
  final String description;
  final String duration;

  Message({
    required this.image,
    required this.vendorImage,
    required this.name,
    required this.date,
    required this.description,
    required this.duration,
  });
}

final List<Message> messages = [
  Message(
      image:
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      vendorImage:
          "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Andrea",
      date: "7/22/2025",
      description: "You: Airbnb update: Reservation of the",
      duration: "Sep 24-28, 2024, Stockach"),
  Message(
      image:
          "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      vendorImage:
          "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Nikolaus",
      date: "7/14/2023",
      description: " Airbnb update: Reminder - leave about",
      duration: "July 9-14, 2024, Konstanz"),
  Message(
      image:
          "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      vendorImage:
          "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Manfred & Mercella",
      date: "7/2/2023",
      description: "You: Airbnb update: Reservation of the",
      duration: "Oct 2-7, 2024, Khajura"),
];
