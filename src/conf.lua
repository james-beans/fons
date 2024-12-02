function lovr.conf(t)
  -- Set the project version and identity
    t.version = '0.18.0'
    t.identity = 'default'

  -- Math settings
    t.math.globals = true

  -- Configure the desktop window
    t.window = {
      width = 1080,
      height = 600,
      resizable = false,
      fullscreen = false,
      title = "Fons Engine",
      icon = "assets/logos/1024x1024logo.png"
    }
    
  end
