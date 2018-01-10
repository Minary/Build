# Build
The Build repository contains scripts to set up your Minary development environment, to compile all projects and to create new release packages.

## Development environment ##
As development environment [**Visual Studio Community 2017**](https://www.visualstudio.com/downloads/) is recommended. 

Git is the preferred versioning system. As git toolset the following software packages have proven useful:
  * [Git for Windows](https://git-for-windows.github.io/)
  * [Sourcetree](https://www.sourcetreeapp.com/)
  
Make sure the Git **bin/path** (either from Git for Windows or Sourcetree) is added to the **PATH environment variable** so you can access the tools via command line. This is a mandatory precondition that must be considered.

## Repository cloning ##
  * Open Git-Bash and clone the [Build repo](https://github.com/minary/Build.git) to your system.
  * Open a command prompt. Change to the directory where the cloned Build repository is located.
  * Inside the Build directory execute the script **FETCH_ALL_REPOS.bat** which clones all involved Minary repositories.

If everything went smoothly and no errors occurred you are ready to compile the solutions/projects and create new Minary builds!!

## Compiling Minary ##
To compile all Minary solutions/projects open a command prompt and execute the batch script **COMPILE.bat** which also is located inside the **Build** directory. As parameter you must define the configuration type. This is either **DEBUG** or **RELEASE**.  

```
 C:\Users\run\code\Minary\Build> COMPILE.bat RELEASE
```

**Attention!!**  
For an unknown reason compiling the _Tools solution_ will fail with the Exception that _fclp_ cannot be found (issue: #20). 
When you've reached this point open the _Tools solution_ in Visual Studio and compile it. After that, _COMPILE.bat_ will compile all solutions without errors.


## Building new release package ##
To build a new Minary release package open a DOS command line and execute the batch script **PACKAGE.bat** which is located inside the **Build** directory. As parameter you must define the configuration type and the version name.  
The configuration type is either **DEBUG** or **RELEASE**.  
There are no restrictions on the version name. But it is recommended to take the same version string as declared in the Minary code (1.0.4).

```
> C:\Users\run\code\Minary\Build> PACKAGE.bat RELEASE 1.0.4
```

If all these steps passed without errors, a new Minary package has been created inside the **Build\BUILDS\RELEASE** directory.
