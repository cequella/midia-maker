class ScreenManager {
  private PApplet m_context;
  private Screen  m_currentScreen;
  
  ScreenManager(PApplet t_context) {
    m_context = t_context;
    
    m_currentScreen = new SplashScreen(m_context);
  }
  
  public void start() {
    if(m_currentScreen.display() == 1){
      exit();
    }
  }
}