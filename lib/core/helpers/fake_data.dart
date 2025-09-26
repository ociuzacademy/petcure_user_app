import 'dart:math';

import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/models/cart_item.dart';
import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/order.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/models/product.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';
import 'package:petcure_user_app/core/models/booking.dart';

class FakeData {
  static List<Pet> generateFakePets({int count = 10}) {
    final Random random = Random();
    final List<Pet> pets = [];
    final DateTime now = DateTime.now();

    // Sample data for random generation
    final List<String> names = [
      'Max',
      'Bella',
      'Charlie',
      'Luna',
      'Lucy',
      'Cooper',
      'Bailey',
      'Sadie',
      'Milo',
      'Daisy',
      'Buddy',
      'Molly',
      'Stella',
      'Tucker',
      'Bear',
      'Zoe',
      'Oliver',
      'Lola',
      'Leo',
      'Roxy',
      'Jack',
      'Penny',
      'Winston',
      'Nala',
    ];

    final List<String> categories = ['Animal', 'Bird', 'Reptile', 'Amphibian'];

    final Map<String, List<String>> subCategories = {
      'Animal': ['Dog', 'Cat', 'Rabbit', 'Cow', 'Goat', 'Others'],
      'Bird': ['Parrot', 'Chicken', 'Duck', 'Quail', 'Lovebird', 'Others'],
      'Reptile': ['Snake', 'Lizard', 'Turtle', 'Tortoise', 'Iguana', 'Others'],
      'Amphibian': ['Frog', 'Toad', 'Salamander', 'Others'],
    };

    final List<String> genders = ['Male', 'Female'];

    final List<String> healthConditions = [
      'None',
      'Allergies',
      'Arthritis',
      'Diabetes',
      'Heart condition',
      'Kidney disease',
      'Thyroid issues',
      'Dental problems',
    ];

    // Generate random pets
    for (int i = 0; i < count; i++) {
      final String category = categories[random.nextInt(categories.length)];
      final List<String> availableSubCategories = subCategories[category]!;
      final String subCategory =
          availableSubCategories[random.nextInt(availableSubCategories.length)];

      // Generate a realistic weight based on category and subcategory
      double weight;
      if (category == 'Animal') {
        if (subCategory == 'Dog') {
          weight = 5 + random.nextDouble() * 45; // 5-50 kg
        } else if (subCategory == 'Cat') {
          weight = 2 + random.nextDouble() * 6; // 2-8 kg
        } else if (subCategory == 'Rabbit') {
          weight = 1 + random.nextDouble() * 4; // 1-5 kg
        } else if (subCategory == 'Cow') {
          weight = 300 + random.nextDouble() * 400; // 300-700 kg
        } else if (subCategory == 'Goat') {
          weight = 20 + random.nextDouble() * 60; // 20-80 kg
        } else {
          weight = 1 + random.nextDouble() * 99; // 1-100 kg for others
        }
      } else if (category == 'Bird') {
        if (subCategory == 'Parrot') {
          weight = 0.1 + random.nextDouble() * 1.4; // 0.1-1.5 kg
        } else if (subCategory == 'Chicken') {
          weight = 1.5 + random.nextDouble() * 3.5; // 1.5-5 kg
        } else if (subCategory == 'Duck') {
          weight = 0.7 + random.nextDouble() * 3.3; // 0.7-4 kg
        } else if (subCategory == 'Quail') {
          weight = 0.1 + random.nextDouble() * 0.2; // 0.1-0.3 kg
        } else if (subCategory == 'Lovebird') {
          weight = 0.04 + random.nextDouble() * 0.06; // 0.04-0.1 kg
        } else {
          weight = 0.1 + random.nextDouble() * 4.9; // 0.1-5 kg for others
        }
      } else if (category == 'Reptile') {
        if (subCategory == 'Snake') {
          weight = 0.5 + random.nextDouble() * 9.5; // 0.5-10 kg
        } else if (subCategory == 'Lizard') {
          weight = 0.1 + random.nextDouble() * 4.9; // 0.1-5 kg
        } else if (subCategory == 'Turtle') {
          weight = 0.5 + random.nextDouble() * 9.5; // 0.5-10 kg
        } else if (subCategory == 'Tortoise') {
          weight = 2 + random.nextDouble() * 18; // 2-20 kg
        } else if (subCategory == 'Iguana') {
          weight = 2 + random.nextDouble() * 8; // 2-10 kg
        } else {
          weight = 0.1 + random.nextDouble() * 19.9; // 0.1-20 kg for others
        }
      } else {
        // Amphibian
        if (subCategory == 'Frog') {
          weight = 0.01 + random.nextDouble() * 0.29; // 0.01-0.3 kg
        } else if (subCategory == 'Toad') {
          weight = 0.05 + random.nextDouble() * 0.45; // 0.05-0.5 kg
        } else if (subCategory == 'Salamander') {
          weight = 0.01 + random.nextDouble() * 0.19; // 0.01-0.2 kg
        } else {
          weight = 0.01 + random.nextDouble() * 0.49; // 0.01-0.5 kg for others
        }
      }

      // Generate birth date (more likely to be younger)
      final int yearsAgo = random.nextInt(15); // 0-15 years ago
      final int monthsAgo = random.nextInt(12); // 0-11 months ago

      // Calculate birth date by subtracting years and months from current date
      final DateTime birthDate = DateTime(
        now.year - yearsAgo,
        now.month - monthsAgo,
        1, // Use 1st of month to avoid day issues
      );

      // Decide if the pet has health conditions (20% chance)
      final bool hasHealthCondition = random.nextDouble() < 0.2;
      final String? healthCondition = hasHealthCondition
          ? healthConditions[random.nextInt(healthConditions.length - 1) + 1]
          : null;

      pets.add(
        Pet(
          petId: 'pet_${i + 1}',
          ownerId: 'owner_${random.nextInt(5) + 1}',
          name: names[random.nextInt(names.length)],
          birthDate: birthDate,
          category: category,
          subCategory: subCategory,
          photoUrl: 'https://picsum.photos/200/200?random=$i',
          weight: double.parse(weight.toStringAsFixed(1)),
          gender: genders[random.nextInt(genders.length)],
          healthConditions: healthCondition,
        ),
      );
    }

    return pets;
  }

  static List<Doctor> generateFakeDoctors({int count = 10}) {
    final Random random = Random();

    final List<String> firstNames = [
      'John',
      'Jane',
      'Michael',
      'Sarah',
      'David',
      'Lisa',
      'Robert',
      'Emily',
      'William',
      'Jessica',
      'James',
      'Amanda',
      'Christopher',
      'Michelle',
      'Daniel',
      'Ashley',
      'Matthew',
      'Jennifer',
      'Anthony',
      'Elizabeth',
    ];

    final List<String> lastNames = [
      'Smith',
      'Johnson',
      'Williams',
      'Brown',
      'Jones',
      'Garcia',
      'Miller',
      'Davis',
      'Rodriguez',
      'Martinez',
      'Hernandez',
      'Lopez',
      'Gonzalez',
      'Wilson',
      'Anderson',
      'Thomas',
      'Taylor',
      'Moore',
      'Jackson',
      'Martin',
    ];

    final List<String> domains = [
      'gmail.com',
      'yahoo.com',
      'hotmail.com',
      'outlook.com',
      'hospital.org',
      'clinic.com',
      'medicalcenter.com',
    ];

    final List<String> streetNames = [
      'Main St',
      'Oak Ave',
      'Pine St',
      'Maple Dr',
      'Cedar Ln',
      'Elm St',
      'Washington Blvd',
      'Lakeview Dr',
      'Hill St',
      'Park Ave',
    ];

    final List<String> cities = [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Phoenix',
      'Philadelphia',
      'San Antonio',
      'San Diego',
      'Dallas',
      'San Jose',
    ];

    String generatePhoneNumber() {
      final areaCode = random.nextInt(900) + 100;
      final prefix = random.nextInt(900) + 100;
      final lineNumber = random.nextInt(9000) + 1000;
      return '($areaCode) $prefix-$lineNumber';
    }

    // Generate a single random doctor
    Doctor generateRandomDoctor({int? id}) {
      final firstName = firstNames[random.nextInt(firstNames.length)];
      final lastName = lastNames[random.nextInt(lastNames.length)];
      final domain = domains[random.nextInt(domains.length)];
      final street = streetNames[random.nextInt(streetNames.length)];
      final city = cities[random.nextInt(cities.length)];

      return Doctor(
        doctorId: id ?? random.nextInt(10000),
        name: 'Dr. $firstName $lastName',
        email: '${firstName.toLowerCase()}.${lastName.toLowerCase()}@$domain',
        address: '${random.nextInt(1000) + 1} $street, $city',
        phone: generatePhoneNumber(),
        latitude: (random.nextDouble() * 180 - 90).toStringAsFixed(6),
        longitude: (random.nextDouble() * 360 - 180).toStringAsFixed(6),
      );
    }

    return List.generate(count, (index) => generateRandomDoctor(id: index + 1));
  }

  static List<Product> generateFakeProducts({int count = 20}) {
    final Random random = Random();
    final List<Product> products = [];

    // Map of pet categories and subcategories as provided
    final Map<String, List<String>> petCategories = {
      'Animal': ['Dog', 'Cat', 'Rabbit', 'Cow', 'Goat', 'Others'],
      'Bird': ['Parrot', 'Chicken', 'Duck', 'Quail', 'Lovebird', 'Others'],
      'Reptile': ['Snake', 'Lizard', 'Turtle', 'Tortoise', 'Iguana', 'Others'],
      'Amphibian': ['Frog', 'Toad', 'Salamander', 'Others'],
    };

    // Product categories for each subcategory
    final Map<String, List<String>> productCategories = {
      // Animal products
      'Dog': [
        'Food',
        'Toy',
        'Collar',
        'Leash',
        'Bed',
        'Shampoo',
        'Treat',
        'Bowl',
        'Harness',
      ],
      'Cat': [
        'Food',
        'Toy',
        'Scratching Post',
        'Litter',
        'Bed',
        'Treat',
        'Carrier',
        'Tree',
      ],
      'Rabbit': [
        'Food',
        'Hutch',
        'Toy',
        'Bedding',
        'Treat',
        'Water Bottle',
        'Hay Feeder',
      ],
      'Cow': ['Feed', 'Mineral Block', 'Brush', 'Milking Equipment', 'Halter'],
      'Goat': ['Feed', 'Mineral Block', 'Brush', 'Milking Equipment', 'Halter'],
      // Bird products
      'Parrot': ['Food', 'Cage', 'Perch', 'Toy', 'Treat', 'Mineral Block'],
      'Chicken': ['Feed', 'Coop', 'Nesting Box', 'Poultry Grit', 'Feeder'],
      'Duck': ['Feed', 'Pond', 'Nesting Box', 'Poultry Grit', 'Feeder'],
      'Quail': ['Feed', 'Cage', 'Nesting Box', 'Poultry Grit', 'Feeder'],
      'Lovebird': ['Food', 'Cage', 'Perch', 'Toy', 'Treat', 'Mineral Block'],
      // Reptile products
      'Snake': [
        'Food',
        'Terrarium',
        'Heating Lamp',
        'Hideout',
        'Substrate',
        'Water Bowl',
      ],
      'Lizard': [
        'Food',
        'Terrarium',
        'Heating Lamp',
        'UVB Light',
        'Hideout',
        'Substrate',
      ],
      'Turtle': ['Food', 'Tank', 'Basking Platform', 'Water Filter', 'Heater'],
      'Tortoise': ['Food', 'Enclosure', 'Heating Lamp', 'Hideout', 'Substrate'],
      'Iguana': [
        'Food',
        'Terrarium',
        'Heating Lamp',
        'Climbing Branch',
        'UVB Light',
      ],
      // Amphibian products
      'Frog': [
        'Food',
        'Terrarium',
        'Water Conditioner',
        'Hideout',
        'Substrate',
        'Mister',
      ],
      'Toad': [
        'Food',
        'Terrarium',
        'Water Conditioner',
        'Hideout',
        'Substrate',
        'Mister',
      ],
      'Salamander': [
        'Food',
        'Terrarium',
        'Water Conditioner',
        'Hideout',
        'Substrate',
        'Mister',
      ],
      // Default for "Others" in each category
      'Others': ['Food', 'Habitat', 'Toy', 'Care Kit', 'Grooming Supplies'],
    };

    // Product adjectives for more interesting names
    final List<String> adjectives = [
      'Premium',
      'Deluxe',
      'Eco-Friendly',
      'Organic',
      'Natural',
      'Super',
      'Ultra',
      'Advanced',
      'Professional',
      'Luxury',
    ];

    // Quantity units
    final List<String> quantityUnits = [
      'kg',
      'g',
      'lb',
      'pack',
      'piece',
      'bottle',
      'bag',
    ];

    // Generate random products
    for (int i = 0; i < count; i++) {
      // Select random category and subcategory
      final List<String> categories = petCategories.keys.toList();
      final String petCategory = categories[random.nextInt(categories.length)];
      final List<String> subCategories = petCategories[petCategory]!;
      final String petSubCategory =
          subCategories[random.nextInt(subCategories.length)];

      // Get product category based on subcategory
      final String productCategory = productCategories[petSubCategory] != null
          ? productCategories[petSubCategory]![random.nextInt(
              productCategories[petSubCategory]!.length,
            )]
          : productCategories['Others']![random.nextInt(
              productCategories['Others']!.length,
            )];

      // Generate product name
      final String adjective = adjectives[random.nextInt(adjectives.length)];
      final String productName = '$adjective $petSubCategory $productCategory';

      // Generate product description
      final String productDescription =
          'High-quality $productCategory specially designed for $petSubCategory. '
          'Made with premium materials to ensure your pet\'s health and happiness.';

      // Generate price (between 5 and 200)
      final double price = 5.0 + random.nextDouble() * 195.0;

      // Generate quantity (between 1 and 20 with random unit)
      final int quantityValue = 1 + random.nextInt(20);
      final String quantityUnit =
          quantityUnits[random.nextInt(quantityUnits.length)];
      final String quantity = '$quantityValue $quantityUnit';

      // Generate image URLs (using placeholder service)
      final List<String> imageURLs = [
        'https://picsum.photos/300/300?random=$i&pet=${petSubCategory.toLowerCase()}',
        'https://picsum.photos/300/300?random=${i + 1000}&pet=${petSubCategory.toLowerCase()}',
      ];

      // Generate days to deliver (between 1 and 14 days)
      final int daysToDeliver = 1 + random.nextInt(14);

      products.add(
        Product(
          productID: 'prod_${i + 1}',
          productName: productName,
          productDescription: productDescription,
          petCategory: petCategory,
          petSubCategory: petSubCategory,
          productCategory: productCategory,
          price: double.parse(price.toStringAsFixed(2)),
          quantity: quantity,
          imageURLs: imageURLs,
          daysToDeliver: daysToDeliver,
        ),
      );
    }

    return products;
  }

  static List<Booking> generateFakeBookingHistory(Pet pet, {int count = 20}) {
    final Random random = Random();
    final List<Doctor> doctors = generateFakeDoctors();
    final List<SlotModel> slots = AppHelpers.generateTimeSlots();
    final List<String> reasons = AppHelpers.bookingReasons;
    final List<BookingOption> bookingOptions = BookingOption.values;

    final List<Booking> bookings = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      // Generate a random date in the past (up to 1 year ago)
      final int daysAgo = random.nextInt(365); // 0 to 364 days ago
      final DateTime bookingDate = now.subtract(Duration(days: daysAgo));

      // Get random doctor, slot, reason, and booking option
      final Doctor doctor = doctors[random.nextInt(doctors.length)];
      final SlotModel timeSlot = slots[random.nextInt(slots.length)];
      final String reasonForBooking = reasons[random.nextInt(reasons.length)];
      final BookingOption bookingOption =
          bookingOptions[random.nextInt(bookingOptions.length)];

      bookings.add(
        Booking(
          pet: pet,
          doctor: doctor,
          bookingDate: bookingDate,
          timeSlot: timeSlot,
          reasonForBooking: reasonForBooking,
          bookingOption: bookingOption,
        ),
      );
    }

    // Sort bookings by date (most recent first)
    bookings.sort((a, b) => b.bookingDate.compareTo(a.bookingDate));

    return bookings;
  }

  static List<CartItem> generateFakeCartItems({int count = 5}) {
    final Random random = Random();
    final List<Product> products = generateFakeProducts(count: count * 2);
    final List<CartItem> cartItems = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      // Get a random product
      final Product product = products[random.nextInt(products.length)];

      // Generate random quantity between 1 and 5
      final int quantity = 1 + random.nextInt(5);

      // Calculate delivery date based on product's daysToDeliver
      final DateTime deliveryDate = now.add(
        Duration(days: product.daysToDeliver),
      );

      cartItems.add(
        CartItem(
          product: product,
          quantity: quantity,
          productPrice: product.price * quantity,
          deliveryDate: deliveryDate,
        ),
      );
    }

    return cartItems;
  }

  static List<Order> generateFakeOrders({int count = 5}) {
    final Random random = Random();
    final List<Order> orders = [];
    final List<OrderDeliveryStatus> statuses = OrderDeliveryStatus.values;
    final String userId = 'current_user_id'; // Fixed user ID for single user

    for (int i = 0; i < count; i++) {
      // Generate random order date within the last 30 days
      final DateTime orderDate = DateTime.now().subtract(
        Duration(days: random.nextInt(30)),
      );

      // Generate random cart items for the order
      final int itemCount = 1 + random.nextInt(5);
      final List<CartItem> orderedItems = generateFakeCartItems(
        count: itemCount,
      );

      // Calculate total rate
      final double totalRate = orderedItems.fold(0.0, (sum, item) {
        return sum + (item.productPrice * item.quantity);
      });

      // Calculate estimated delivery date (latest delivery date among items)
      final DateTime estimatedDeliveryDate = orderedItems
          .map((item) => item.deliveryDate)
          .reduce((a, b) => a.isAfter(b) ? a : b);

      // Select random status
      final OrderDeliveryStatus status =
          statuses[random.nextInt(statuses.length)];

      orders.add(
        Order(
          orderId: 'ORD-${DateTime.now().millisecondsSinceEpoch}-${i + 1}',
          userId: userId,
          orderDate: orderDate,
          productsOrdered: orderedItems,
          totalRate: totalRate,
          orderDeliveryStatus: status,
          estimatedDeliveryDate: estimatedDeliveryDate,
        ),
      );
    }

    // Sort orders by date (most recent first)
    orders.sort((a, b) => b.orderDate.compareTo(a.orderDate));

    return orders;
  }
}
