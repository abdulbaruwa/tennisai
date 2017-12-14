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
      this.entrants});
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
  final String highestPlayerRating;
  final List<Entrant> entrants;
}

class Entrant {
  const Entrant({this.name, this.ranking, this.rating, this.ltaNumber});
  final String name;
  final int ranking;
  final String rating;
  final int ltaNumber;
}

const List<Tournament> tournaments = const <Tournament>[
  const Tournament(
      name: 'Sutton Super Series 1',
      location: 'Sutton Tennis Academy',
      grade: '2',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      site: 'www.sherbornetennis.com',
      organiserName: 'David Freeman',
      organiserPhone: '44776639393',
      organiserEmail: 'DavidFreeman@Mail.com',
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Horsham Open',
      location: '',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 23,
      highestPlayerRating: '1.1',
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Salem Cup ',
      location: '',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '2.1',
      numberOfEntrants: 12,
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Surrey Open Champion Ships',
      location: '2',
      grade: '1',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 18,
      highestPlayerRating: '1.1'),
  const Tournament(
      name: 'Valencia Junior cup',
      location: '3',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 8,
      highestPlayerRating: '2.1',
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Surrey Open',
      location: '',
      grade: '4',
      endDate: DateTime.Parse('17 August 2018'),
      startDate: DateTime.Parse('19 August 2018'),
      numberOfEntrants: 7,
      highestPlayerRating: '3.2',
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Nike Boys U16',
      location: 'Liverpool Indoor Arena',
      grade: '2',
      endDate: DateTime.Parse('2 Nov 2017'),
      startDate: DateTime.Parse('9 Nov 2017'),
      numberOfEntrants: 44,
      highestPlayerRating: '2.2'),
  const Tournament(
      name: 'David Lloyds U18',
      location: 'Raynes Park London',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 9,
      highestPlayerRating: '3.1',
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Fast Four Super Series',
      location: 'Sutton Tennis Academy',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 91,
      highestPlayerRating: '4.1'),
  const Tournament(
      name: 'Kalkuta Open',
      location: 'Kalkuta India ',
      grade: '3',
      endDate: new DateTime(2018, 8, 6),
      startDate: new DateTime(2018, 8, 4),
      highestPlayerRating: '3.1',
      numberOfEntrants: 6,
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ]),
  const Tournament(
      name: 'Compete Mens Open',
      location: 'University Of Bath',
      grade: '3',
      endDate: new DateTime(2018, 8, 4),
      startDate: new DateTime(2018, 8, 4),
      numberOfEntrants: 33,
      highestPlayerRating: '3.1',
      entrants: const <Entrant>[
        const Entrant(name: 'Archie Duncan', rating: '7.2', ranking: 124),
        const Entrant(name: 'Ben Dean', rating: '5.2', ranking: 104),
        const Entrant(name: 'Ben Dean', rating: '3.2', ranking: 12),
        const Entrant(name: 'Willie Nelsom', rating: '1.2', ranking: 16),
        const Entrant(name: 'Marvin Ashana', rating: '2.2', ranking: 84),
        const Entrant(name: 'Giva Lukman', rating: '2.1', ranking: 2),
        const Entrant(name: 'Navas Jesus', rating: '8.2', ranking: 1233),
        const Entrant(name: 'Obi Mikaiel', rating: '1.2', ranking: 2),
      ])
];
