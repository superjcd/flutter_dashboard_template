import 'package:dashboard_template/models/index.dart';

List<User> dummyUsers = _json.map((json) {
  if (json
      case {
        'userId': String _,
        'name': String _,
        'role': String _ ,
      }) {
    return User.fromJson(json);
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

// Generated by ChatGPT
const _json = [
  {
    'userId': 'd51b4a1e-3c25-4e81-8f63-84d1253c7181',
    'name': 'Alice Johnson',
    'role': 'manager',
  },
  {
    'userId': '9c6a544a-4edf-4a76-bc89-d90b901be81a',
    'name': 'Bob Smith',
    'role': 'engineer',
  },
  {
    'userId': '2f46f92f-9d57-4e04-9765-3123483b354b',
    'name': 'Charlie Brown',
    'role': 'designer',
  },
  {
    'userId': '92b4e3a9-5c5f-4b44-bec3-8e5c10f4a587',
    'name': 'David Davis',
    'role': 'sales',
  },
  {
    'userId': '0b192083-8f70-415b-89e4-53a273d69f0b',
    'name': 'Eve Williams',
    'role': 'marketer',
  },
  {
    'userId': '1dd76cb0-cd01-4d3c-b77e-2ce6f5ff70ce',
    'name': 'Frank Anderson',
    'role': 'manager',
  },
  {
    'userId': 'f76c47e3-49f6-4d4f-8bf7-2263c4e47b9e',
    'name': 'Grace Martinez',
    'role': 'engineer',
  },
  {
    'userId': 'd51e5f92-cda5-4f54-9bf4-63935d9ecf42',
    'name': 'Hannah Taylor',
    'role': 'designer',
  },
  {
    'userId': 'a429f3f3-348d-4455-8b67-74a2f971232d',
    'name': 'Isaac Thomas',
    'role': 'sales',
  },
  {
    'userId': 'e932a54c-882d-45a5-b90a-218b8b7e9476',
    'name': 'Jack White',
    'role': 'marketer',
  },
  {
    'userId': '8250f8f3-aae5-4e6b-9f59-4f09e2c497e9',
    'name': 'Karen Johnson',
    'role': 'manager',
  },
  {
    'userId': 'bf925d9a-745f-4d66-aa7e-e1446db1f51f',
    'name': 'Larry Miller',
    'role': 'engineer',
  },
  {
    'userId': 'c1deada9-e784-4f2b-a047-eb0881f7db12',
    'name': 'Mia Garcia',
    'role': 'designer',
  },
  {
    'userId': '127a56b7-b6b6-4e8a-9e27-6a8c824d5db7',
    'name': 'Nathan Harris',
    'role': 'sales',
  },
  {
    'userId': 'a4acde7d-8d02-4d9a-8e01-d16d7f27ff1e',
    'name': 'Olivia Wilson',
    'role': 'marketer',
  },
  {
    'userId': '19d2ac0a-9a92-4b14-8f11-712c7a486789',
    'name': 'Paul Anderson',
    'role': 'manager',
  },
  {
    'userId': '3ef6e349-663a-4b2f-8c9b-67a4322a6d89',
    'name': 'Quincy Smith',
    'role': 'engineer',
  },
  {
    'userId': '9c7eb895-71ca-423c-9642-5a029b173d69',
    'name': 'Rachel Brown',
    'role': 'designer',
  },
  {
    'userId': '4b29f0e2-29d1-43a1-8be4-2a6c4fb70a4f',
    'name': 'Samuel Johnson',
    'role': 'sales',
  },
  {
    'userId': 'b1998d4a-7bb6-460a-81b0-62e10f0d996a',
    'name': 'Tina Smith',
    'role': 'marketer',
  }
];
