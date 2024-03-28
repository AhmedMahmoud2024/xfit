import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xfit/screens/M/RegistrationProvider.dart';

import 'registration_provider.dart';

class RegistrationScreen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration - Step 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<RegistrationProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  TextField(
                    onChanged: (value) => provider.setName(value),
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    onChanged: (value) => provider.setEmail(value),
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    onChanged: (value) => provider.setPassword(value),
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  TextField(
                    onChanged: (value) => provider.setPhone(value),
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Provider.of<RegistrationProvider>(context, listen: false).nextStep(),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration - Step 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<RegistrationProvider>(
              builder: (context, provider, child) => Column(
                children: [
                  for (int i = 0; i < 5; i++)
                    TextField(
                      onChanged: (value) => provider.setFields5(i, value),
                      decoration: InputDecoration(labelText: 'Field ${i + 1}'),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => Provider.of<RegistrationProvider>(context, listen: false).nextStep(),
              child: Text('Next'),
            ),
            ElevatedButton(
              onPressed: () => Provider.of<RegistrationProvider>(context, listen: false).previousStep(),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration - Step 3')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<RegistrationProvider>(
                builder: (context, provider, child) => Column(
                  children: [
                    for (int i = 0; i < 3; i++)
                      DropdownButton<String>(
                        value: provider.dropdownValues[i],
                        onChanged: (value) => provider.setDropdownValue(i, value!),
                        items: [
                          DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                          DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                          DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
                        ],
                      ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => Provider.of<RegistrationProvider>(context, listen: false).previousStep(),
                child: Text('Back'),
              ),
              ElevatedButton(
                onPressed: () => Provider.of<RegistrationProvider>(context, listen: false).register(),
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
