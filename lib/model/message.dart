class Message {
  final String Image;
  final String vendorImage;
  final String name;
  final String date;
  final String description;
  final String duration;

  Message({
    required this.Image,
    required this.vendorImage,
    required this.name,
    required this.date,
    required this.description,
    required this.duration,
  });

  List<Message> message = [
    Message(
        Image:
            "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        vendorImage:
            "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        name: "usman",
        date: "7/25/23",
        description: "You: Airbnb update: Reservation of the",
        duration: "Sep 24-28, 2024 Stockach"),
    Message(
        Image:
            "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        vendorImage:
            "https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        name: "noman",
        date: "8/10/224",
        description: "You: Airbnb update: Reservation of the",
        duration: "Oct 24-28, 2024 Stockach"),
    Message(
        Image:
            "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        vendorImage:
            "https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        name: "jawad",
        date: "7/25/23",
        description: "You: Airbnb update: Reservation of the",
        duration: "Nov 24-28, 2024 Stockach"),
  ];
}
