function lovr.conf(t)
  -- Set the project version and identity
    t.version = '0.31.2'
    t.identity = 'default'

  -- Configure the desktop window
    t.window.width = 1080
    t.window.height = 600
    t.window.fullscreen = false
    t.window.resizable = false
    t.window.title = 'Fons Engine'
    t.window.icon = "assets/logos/logo.png"

  -- Graphics settings
    t.graphics.vsync = true

  -- Math settings
    t.math.globals = true

  end
