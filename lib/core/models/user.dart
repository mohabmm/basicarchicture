class User {
  final String email;
  final String name;
  final String uid;
  final String photoUrl;
  final bool driverAuthenticated;
  final int numberOfRidesAsDriver;
  final int numberOfRidesAsGuest;
  final String driverRate;
  final String passengerRate;
  final int distanceCoveredAsDriver;
  final int distanceCoveredAsPassenger;
  final String co2Driver;
  final String co2Passenger;

  User({
    this.email,
    this.name,
    this.uid,
    this.photoUrl,
    this.driverAuthenticated,
    this.numberOfRidesAsDriver,
    this.numberOfRidesAsGuest,
    this.driverRate,
    this.passengerRate,
    this.distanceCoveredAsDriver,
    this.distanceCoveredAsPassenger,
    this.co2Driver,
    this.co2Passenger,
  });

  User.fromSnapshot(Map<String, dynamic> data)
      : email = data['email'] ?? "null email",
        name = data['name'] ?? 'nullname',
        uid = data['uid'] ?? '232323',
        photoUrl = data['photoUrl'] ??
            "https://sanitationsolutions.net/wp-content/uploads/2015/05/empty-image.png",
        driverAuthenticated = data['driverAuthnticated'] ?? false,
        numberOfRidesAsDriver = data['numberOfRidesAsDriver'] ?? 0,
        numberOfRidesAsGuest = data['numberOfRidesAsGuest'] ?? 0,
        driverRate = data['driverRate'] ?? '0',
        passengerRate = data['passengerRate'] ?? '0',
        distanceCoveredAsDriver = data['distanceCoveredAsDriver'] ?? 0,
        distanceCoveredAsPassenger = data['distanceCoveredAsPassenger'] ?? 0,
        co2Driver = data['cO2Driver'] ?? '0',
        co2Passenger = data['cO2Passenger'] ?? '0';
}
