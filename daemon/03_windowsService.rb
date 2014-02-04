# 03_windowsService.rb
require 'rubygems'
require 'win32/service'
include Win32

SERVICE_NAME = "RubySvc"
SERVICE_DISPLAYNAME = "A Ruby Service"

if ARGV[0] == "register"
  # Start the service.
  svc = Service.new
  svc.create_service do |s|
    s.service_name = SERVICE_NAME
    s.display_name = SERVICE_DISPLAYNAME
    s.binary_path_name = 'C:\InstantRails-1.3\ruby\bin\ruby ' + File.expand_path($0)
    s.dependencies = []
  end
  svc.close
  puts "Register Service - " + SERVICE_DISPLAYNAME

elsif ARGV[0] = "delete"
  # Stop the service
  if Service.status(SERVICE_NAME).current_state == "running"
    Service.stop(SERVICE_NAME)
  end
  Service.delete(SERVICE_NAME)
  puts "Removed Service - " + SERVICE_DISPLAYNAME
  else
    if ENV["HOMEDRIVE"] != nil
# We are not running as a service, but the user didn't provide any 
# command line arguments. We've got nothing to do
    puts "Usage: ruby 03_windowsService.rb [option]"
    puts "  Where option is one of the following:"
    puts "    register - To register the Service so it " + 
    "appears in the control panel"
    puts "    delete   - To delete hte Service from the control panel"
    exit
  end
#if we got this far, we are running as a service
  class Daemon
    def service_init
      # Give the service time to get everything initialized and running
      # before we entre the service_main function
      sleep 10
    end

    def service_main
      fileCount = 0 #Initialize the file counter for the rename
      watchForFile = "c:\\WeAreOne.txt"
      while state == RUNNING
        sleep 5
	if File.exists? watchForFile
	  fileCount += 1
  	  File.rename watchForFile, watchForFile + "." + fileCount.to_s
        end
      end
    end
  end
  d = Daemon.new
  d.mainloop
end


	









