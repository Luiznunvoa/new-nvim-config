require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
  },
  project = {
    ["~/Dev/Projects/my-game/client"] = {
      name = "My game client",
      description = "Client of my simple java project",
      command = "mvn clean package -q; java -jar ~/Dev/Projects/my-game/client/target/client-1.0-SNAPSHOT.jar"
    },
    ["~/Dev/Projects/my-game/server"] = {
      name = "My game server",
      description = "Server of my simple java project",
      command = "mvn clean package -q; java -jar ~/Dev/Projects/my-game/server/target/server-1.0-SNAPSHOT.jar"
    },
    ["~/Dev/Projects/core_3d_camera_first_person/"] = {
      name = "CMAKE PROJECT EXAMPLE",
      description = "just so the next time i do something i can copy",
      command = "cd build; cmake ..; make; ~/Dev/Projects/core_3d_camera_first_person/build/3d_camera_first_person"
    },
  },
})
