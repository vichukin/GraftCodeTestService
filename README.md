# Graftcode Test Service

This repository contains a simple .NET backend service that exposes a "Hello World" method. It is designed to demonstrate the integration with **Graftcode** and the **Graftcode Gateway (gg)** running locally.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:
* [Git](https://git-scm.com/)
* [.NET SDK](https://dotnet.microsoft.com/download)
* [Docker](https://www.docker.com/)
* A **Project Key** from the Graftcode Portal (available when adding a new service).

---

## 🚀 Setup & Installation Guide

Follow these steps to build, configure, and run the service locally.

### 1. Clone the Repository

Open your terminal and clone the repository to your local machine:

```bash
git clone https://github.com/vichukin/GraftCodeTestService
cd GraftCodeTestService
```

### 2. Configure Your Project Key

You need to provide your unique Project Key to the Graftcode Gateway so it can properly authenticate your service.

1. Open the `Dockerfile` in your preferred text editor.
2. Navigate to **line 24**.
3. Replace `"YOUR PROJECT KEY"` with your actual Project Key from the Graftcode Portal.

The line should look like this after your change:

```dockerfile
CMD ["gg", "--projectKey", "YOUR_ACTUAL_PROJECT_KEY_HERE", "--modules", "/usr/app/GraftCodeTestServices.dll"]
```

### 3. Build and Publish the .NET Application

Next, compile and publish the .NET project:

```bash
dotnet build ./GraftCodeTestServices.csproj 
dotnet publish ./GraftCodeTestServices.csproj 
```

### 4. Build the Docker Image

Build the Docker image. *(Note: Docker requires repository names to be lowercase, and the command requires a dot `.` at the end to specify the current directory)*:

```bash
docker build --no-cache --pull -t graftcodetestservices:test .
```

### 5. Run the Docker Container

Start the container in detached mode, mapping the necessary ports:

```bash
docker run -d -p 80:80 -p 81:81 --name graftcode_demo graftcodetestservices:test
```

### 6. Verify the Service

To confirm that the service and the Graftcode Gateway are running correctly, open your web browser and navigate to:

**[http://localhost:81/GV](http://localhost:81/GV)**

If everything is configured correctly, you should see the Graftcode interface or the service response.
