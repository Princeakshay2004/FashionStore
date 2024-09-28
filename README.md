# FashionStore

FashionStore is a comprehensive web application designed to manage a fashion e-commerce platform. The application includes essential features for users, admin management, product catalog, order processing, and secure authentication with third-party providers.

## Features

1. **User Management**
   - User registration and login with options for Google, Facebook, and GitHub authentication.
   - Role-based access control (User/Admin).
   
2. **Product Catalog**
   - Browse fashion products with detailed information.
   - Filter and search products by categories.

3. **Shopping Cart**
   - Add products to the cart.
   - Update or remove items before checkout.

4. **Order Management**
   - Place orders.
   - View order history and status.

5. **Payment Integration**
   - Secure payment gateway integration (TBD).

6. **Admin Panel**
   - Manage products (add, update, delete).
   - View and manage customer orders.
   - Generate sales reports.

## Technologies Used

### Frontend
- **JSP** - For dynamic content rendering.
- **Bootstrap** - To design responsive user interfaces.
- **JavaScript** - For enhancing user interactivity.
- **Spring MVC** - For handling requests and views.

### Backend
- **Spring Boot** - For building and managing the backend REST APIs.
- **Java** - Core language for application development.
- **Spring JPA** - For database persistence and interaction with MySQL.
- **Spring Security** - For handling authentication and authorization.
  
### Authentication
- OAuth integration for:
  - **Google**
  - **Facebook**
  - **GitHub**

### Database
- **MySQL** - To store user data, product information, and order details.

### Cloud Service
- **Cloudinary** - For managing and storing media assets (e.g., product images).


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Installation

To set up the project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Princeakshay2004/fashionstore.git
2. Configure the MySQL database:
  -  Ensure you have MySQL installed and running.
  - Create a new database fashion_store.
  - Update the database configuration in application.properties with your MySQL credentials.
  - Update the application.properties file with the following details:

      spring.datasource.url=jdbc:mysql://localhost:3306/fashion_store
      spring.datasource.username=your_mysql_username
      spring.datasource.password=your_mysql_password
      spring.jpa.hibernate.ddl-auto=update


3. Run the application:
   - mvn spring-boot:run

4. Access the application:
   - Open your browser and go to: http://localhost:8080
