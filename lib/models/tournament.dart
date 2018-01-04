class Tournament {
  const Tournament(
      {this.name,
      this.grade,
      this.startDate,
      this.endDate,
      this.location,
      this.numberOfEntrants,
      this.organiserName,
      this.organiserEmail,
      this.organiserPhone,
      this.entryCloseDate,
      this.code,
      this.status,
      this.site,
      this.highestPlayerRating,
      this.entrants,
      this.cost});
  final String name;
  final String grade;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final int numberOfEntrants;
  final String organiserName;
  final String organiserPhone;
  final String organiserEmail;
  final DateTime entryCloseDate;
  final String code;
  final String status;
  final String site;
  final double cost;
  final String highestPlayerRating;
  final List<Entrant> entrants;
}

class Entrant {
  const Entrant({this.name, this.ranking, this.rating, this.ltaNumber, this.status});
  final String name;
  final int ranking;
  final String rating;
  final int ltaNumber;
  final String status;
}

List<Tournament> tournaments =  <Tournament>[
  new Tournament(
      name: 'Sutton Super Series 1',
      location: 'Sutton Tennis Academy',
      grade: '2',
      endDate: new DateTime(2018, 7, 6),
      startDate:new DateTime(2018, 7, 9),
      site: 'www.sherbornetennis.com',
      organiserName: 'David Freeman',
      organiserPhone: '44776639393',
      organiserEmail: 'DavidFreeman@Mail.com',
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      status:'Accepting Entries', cost:25.0, entrants:  <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Horsham Open',
      location: '',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 23,
      highestPlayerRating: '1.1',
      status:'Accepting Entries', cost:25.0, entrants:  <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Salem Cup ',
      location: '',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      status:'Accepting Entries', cost:25.0, entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
 new Tournament(
      name: 'Surrey Open Champion Ships',
      location: '2',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 18,
      highestPlayerRating: '1.1', status:'Accepting Entries', cost:25.0),
  new Tournament(
      name: 'Valencia Junior cup',
      location: '3',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 8,
      highestPlayerRating: '2.1',
      status:'Accepting Entries', cost:25.0, entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Surrey Open',
      location: '',
      grade: '4',
      endDate:new DateTime(2018, 8, 1),
      startDate: new DateTime(2018, 8, 6),
      numberOfEntrants: 7,
      highestPlayerRating: '3.2',
     status:'Accepting Entries', cost:25.0, entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Nike Boys U16',
      location: 'Liverpool Indoor Arena',
      grade: '2',
      endDate: new DateTime(2018, 8, 2),
      startDate: new DateTime(2018, 8, 6),
      numberOfEntrants: 44,
      highestPlayerRating: '2.2'),
  new Tournament(
      name: 'David Lloyds U18',
      location: 'Raynes Park London',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 9,
      highestPlayerRating: '3.1',
      status:'Accepting Entries', cost:25.0, entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Fast Four Super Series',
      location: 'Sutton Tennis Academy',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 91,
      highestPlayerRating: '4.1'),
  new Tournament(
      name: 'Kalkuta Open',
      location: 'Kalkuta India ',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '3.1',
      numberOfEntrants: 6,
      status:'Accepting Entries', cost:25.0, entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ]),
  new Tournament(
      name: 'Compete Mens Open',
      location: 'University Of Bath',
      grade: '3',
      endDate: new DateTime(2018, 8, 4),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 33,
      highestPlayerRating: '3.1',
      status:'Accepting Entries', cost:25.0, entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', status: 'pending', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', status: 'pending', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', status: 'pending', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', status: 'pending', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', status: 'pending', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', status: 'pending', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', status: 'pending', rating: '1.2', ranking: 2),
      ])
];
