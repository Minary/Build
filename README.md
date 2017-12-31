# Build
The Build repository contains the scripts to set up your Minary development environment, to compile all projects and to create new release packages.

## Development environment ##
As development environment [**Visual Studio Community 2017**](https://www.visualstudio.com/downloads/) is recommended. 

Git is the prefered versioning system. As git toolset the following software packages have proven useful:
  * [Git for Windows](https://git-for-windows.github.io/)
  * [Sourcetree](https://www.sourcetreeapp.com/)
  
Make sure the Git **bin/ path** (either from Git for Windows or Sourcetree) is added to the **PATH environment variable** so you can access the tools via command line. This is a mandatory precondition that must be considered.

## Repository cloning ##
  * Open Git-Bash and clone the [Build repo](https://github.com/minary/Build.git) to your system.
  * Open a DOS command line. Change to the directory where the cloned Build repository is located.
  * Inside the Build directory execute the script **FETCH_ALL_REPOS.bat** which clones all involved Minary repositories.

If everything went smoothly and no errors occurred you are ready to compile the solutions/projects and create new Minary builds!!

## Compiling Minary ##
To compile all Minary solutions/projects open a DOS command line and execute the batch script **COMPILE.bat** which also is located inside the **Build** directory. As parameter you must define the configuration type. This is either **DEBUG** or **RELEASE**.  
  
> C:\Users\run\code\Minary\Build> COMPILE.bat RELEASE  
> Load MSBuild command environment  
> &ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;&ast;  
> &ast;&ast; Visual Studio 2017 MSBuild Command Prompt  
> &ast;&ast; Copyright (c) 2017 Microsoft Corporation  
> ...  

**Attention!!**  
For an unknown reason compiling the _Tools solution_ will fail with the Exception that _fclp_ cannot be found (issue: #20). 
When you've reached this point open the _Tools solution_ in Visual Studio and compile it. After that the _COMPILE.bat_ will compile all solutions without errors.


## Building new release package ##
To build a new Minary release package open a DOS command line and execute the batch script **PACKAGE.bat** which is located inside the **Build** directory. As parameter you must define the configuration type and the version name.  
The configuration type is either **DEBUG** or **RELEASE**.  
There are no restrictions on the version name. But it is recommende to take the same version string as declared in the Minary code (1.0.4).


> C:\Users\run\code\Minary\Build> BuildMinaryPacket.bat RELEASE  
> BUILD_DIR: BUILDS\RELEASE\Minary_1.0.4\  
> Creating new Mianry release BUILDS\RELEASE\Minary_1.0.4\  
>  
> Copying Minary ...  

If all these steps passed without errors a new Minary package was created inside the **Build\BUILDS\RELEASE** directory.
