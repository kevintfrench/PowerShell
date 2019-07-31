### Step 1: Discover the Assemblies loaded within a PowerShell Session

[appdomain]::CurrentDomain.GetAssemblies()

### Step 2: Get Basic Details of a Loaded Assembly (in this example mscorlib)

 
[appdomain]::currentdomain.GetAssemblies() | 
Where-Object Location -match 'mscorlib'

### Step 3: Discover The Types/Classes Inside a Given Assembly

([appdomain]::currentdomain.GetAssemblies() | 
Where-Object Location -Match 'mscorlib').gettypes()

### Step 4: To Discover the Members Within a Class

(([appdomain]::currentdomain.GetAssemblies() | 
Where-Object location -match 'mscorlib').gettypes() | 
Where-Object name -eq 'string').getmembers() | 
Format-Table name, membertype

### Step 5: Discover Method Overloads

### Using the previous step, you may find multiple occurrences of a given method name. In .NET, methods can be overloaded and have many different sets of parameters. 
### To discover the different calling sequences, aka method signatures, for a static method. like the Format method on System.String:

[system.string]::Format

### To discover the overloaded method signatures for instance methods, such as the StartsWith method of System.String:

("sss").startswith

