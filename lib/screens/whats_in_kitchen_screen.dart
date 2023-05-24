import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  List items = [
    {"name": "Apple", "imageUrl": "https://dummyimage.com/600x400/000/fff"},
    {"name": "Mango", "imageUrl": "https://dummyimage.com/600x400/000/fff"},
    {"name": "Orange", "imageUrl": "https://dummyimage.com/600x400/000/fff"},
    {"name": "Apple", "imageUrl": "https://dummyimage.com/600x400/000/fff"},
    {"name": "Mango", "imageUrl": "https://dummyimage.com/600x400/000/fff"},
    {"name": "Orange", "imageUrl": "https://dummyimage.com/600x400/000/fff"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "What's in your kitchen?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Enter up to 2 ingredients",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    _buildTypeYourIngredientsFeild(),
                    const SizedBox(
                      height: 48,
                    ),
                    _buildSelectedIngredientsList(),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomNavigationBarItem(context),
        ],
      ),
    );
  }

  Widget _buildSelectedIngredientsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final currentIngredient = items[index];
        return _buildSelectedIngredient(currentIngredient);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.03),
                offset: const Offset(
                  0,
                  8,
                ),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeYourIngredientsFeild() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            offset: const Offset(0, 8),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type and add your ingredients..",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 8,
                bottom: 8,
                right: 12,
              ),
              child: Container(
                height: 34,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        0xff4FA9AF,
                      ).withOpacity(0.3),
                      offset: const Offset(0, 12),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                  color: const Color(
                    0xff4FA9AF,
                  ),
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12.0,
          top: 4,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: 20,
                right: 12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Find recipes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF303030,
                      ),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedIngredient(Map<String, String> currentIngredient) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FD),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 80,
      child: Row(
        children: [
          _buildIngredientImage(currentIngredient["imageUrl"]!),
          const SizedBox(
            width: 12,
          ),
          _buildSelectedIngredientName(currentIngredient["name"]!),
          const Spacer(),
          _buildRemoveIngredientFromListButton(),
        ],
      ),
    );
  }

  Widget _buildIngredientImage(String imageUrl) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          8,
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSelectedIngredientName(String name) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildRemoveIngredientFromListButton() {
    return InkWell(
      onTap: () {
        return;
      },
      child: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(
            0xFFFF8F44,
          ),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
