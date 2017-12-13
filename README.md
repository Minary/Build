# Build
The Build repository contains the scripts to set up your Minary development environment, to compile all projects and to create a new release package.

## Development environment ##
As development environment [**Visual Studio Community 2017**](https://www.visualstudio.com/downloads/) is recommended. Furthermore the following Visual Studio extensions are recommended to install:
  * Productivity Power Tools 2017
  * Stylecop

As git toolset the following software packages have proven useful:
  * [Git for Windows](https://git-for-windows.github.io/)
  * [Sourcetree](https://www.sourcetreeapp.com/)
  
Make sure the Git **bin/ path** (either from Git for Windows or Sourcetree) is added to the **PATH environment variable** so you can access the tools via command line. This is a precondition before you can continue with the next step.

## Repository cloning ##
  * Open Git-Bash and **Clone the Build repo** to your Windows system
  * Open a DOS command line and change to the directory that you have just cloned from the Build repository, the **Build** directory
  * Inside the Build directory execute the script **FetchRepos.bat** which clones all required Minary repositories at their right place.

If everything went smoothly and no errors occurred you are ready to compile the solutions/projects and create new Minary builds!!

## Compiling Minary ##
To compile all Minary solutions/projects open a DOS command line and execute the batch script **CompileSolution.bat** located inside the **Build** directory. As parameter you must define the configuration type. This is either **DEBUG** or **RELEASE**.  
  
> C:\Users\run\code\Minary\Build> CompileSolution.bat RELEASE  
> Load MSBuild command environment  
> &ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;  
> &ast;&ast; Visual Studio 2017 MSBuild Command Prompt  
> &ast;&ast; Copyright (c) 2017 Microsoft Corporation  
> ...  

## Building new release package ##
To build a new Minary release package open a DOS command line and execute the batch script **BuildMinaryPacket.bat** located inside the **Build** directory. As parameter you must define the configuration type and the version name. The configuration type is either **DEBUG** or **RELEASE**. There are no restrictions on the version name. But it is recommende to take the same version string as declared in the Minary code (1.0.4).


> C:\Users\run\code\Minary\Build> BuildMinaryPacket.bat RELEASE  
> BUILD_DIR: BUILDS\RELEASE\Minary_1.0.4\  
> Creating new Mianry release BUILDS\RELEASE\Minary_1.0.4\  
>  
> Copying Minary ...  

If all these steps passed without errors a new Minary is ready inside the **Build\BUILDS\RELEASE\** directory.
