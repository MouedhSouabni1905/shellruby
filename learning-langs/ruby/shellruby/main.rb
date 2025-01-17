# Uncomment this block to pass the first stage


def find(array,target)

  array.find {|element| element==target}

end

def echo(args)
  
  args.delete_at(0)
  
  args.each do |a|
    printf("%s ",a)
  end
  
  printf("\n")

end

def find_path(cmd)
  for path in ENV["PATH"].split(":") do
      loc = File.join(path, cmd)
      return loc if File.exist?(loc)
  end
  return nil
end


def type(cmd,types)
  result=types.find {|type_name, type|
    type.include?(cmd)}&.first
  path=find_path(cmd)
  if result then puts "#{cmd} is a shell #{result}"
  elsif path!=nil
    puts "#{cmd} is #{path}"
  else
    puts "#{cmd}: not found"
  end
end



cmdlist=["exit","echo","type"]

sh_types = {
  "builtin" => ["exit","echo","type"]
}

cmdline=[]
# Wait for user input

while cmdline[0]!="exit"

  command, *args = printf("$ "); cmdline=gets.chomp.split(" ")
  
  if !find(cmdlist, cmdline[0]) then printf(cmdline[0]+": command not found\n") end
  
  if cmdline[0]=="echo" then
  
    if cmdline[1]==nil then puts "echo: missing arguments"
    else echo(cmdline)
    end
  
  end

  if cmdline[0]=="type"
    if cmdline[1]==nil then puts "echo: missing arguments"
    else type(cmdline[1],sh_types)
    end
  end
end
