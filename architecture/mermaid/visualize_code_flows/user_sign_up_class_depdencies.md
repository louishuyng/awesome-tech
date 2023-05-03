```mermaid
---
    title: User Sign Up Class Dependencies
---
classDiagram
    class UserController {
        -CreateUserService _createUserService
        +UserController(CreateUserService createUserService)
        +Create(String email, string username) User
    }
    
    class CreateUserRequest {
 	    +string Email
 	    +string Username

 	    +Validate() bool
 	}

    class CreateUserService {
        -UserModel _userModel
        -SendWelcomeEmailService _sendWelcomeEmailService
        -Kafka _kafka
        +CreateUserService(UserModel um, SendWelcomeEmailService es, Kafka k)
        +Call(CreateUserRequest createUserRequest) User
        -CheckActiveUsers(List~User~ users) bool
    }
    
    class UserModel {
        +FindUsersByEmail(string email) List~User~
        +CreateUser(string email, string username) User
    }
    
    class User {
        +int UserId
        +string Username
        +string Email
    }
    
    class SendWelcomeEmailService {
        +Call(User) bool
    }
    
    class Kafka {
        +PublishUserCreatedEvent(User) bool
    }

    UserController ..> CreateUserService: depends on
    UserController ..> CreateUserRequest: depends on
    CreateUserService ..> UserModel: depends on
    UserModel ..> User: depends on
 	CreateUserService ..> SendWelcomeEmailService: depends on
 	CreateUserService ..> Kafka: depends on
```