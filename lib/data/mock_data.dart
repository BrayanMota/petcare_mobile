import '../models/pet.dart';

List<Pet> mockPets = [
  Pet.withId(
    id: '1',
    name: 'Rex',
    breed: 'Labrador',
    type: 'Cachorro',
    age: 5,
    ownerName: 'João Silva',
    weight: 30.0,
  ),
  Pet.withId(
    id: '2',
    name: 'Milo',
    breed: 'Siamês',
    type: 'Gato',
    age: 3,
    ownerName: 'Maria Souza',
    weight: 4.5,
  ),
  Pet.withId(
    id: '3',
    name: 'Bella',
    breed: 'Bulldog',
    type: 'Cachorro',
    age: 4,
    ownerName: 'Alice Oliveira',
    weight: 22.0,
  ),
  Pet.withId(
    id: '4',
    name: 'Charlie',
    breed: 'Persa',
    type: 'Gato',
    age: 2,
    ownerName: 'Roberto Lima',
    weight: 5.0,
  ),
];
