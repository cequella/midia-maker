abstract class Screen {
  private PApplet m_context;
  
  private boolean m_ready = false;
  private String  m_title;
  private Screen  m_screen;
  private long    m_startFrame;
  
  public Screen(PApplet t_context, String t_title) {
    m_context = t_context;
    m_title   = t_title;
    m_screen  = this;
    
    Loader loader = new Loader();
    loader.start();
  }
  
  protected abstract void notReady(PApplet context);
  protected abstract void ready(PApplet context);
  protected abstract void load(PApplet context);
  protected abstract void events(PApplet context);
  
  public final Screen display() {
    if(m_ready) {
      ready(m_context);
    } else {
      notReady(m_context);
    }
    
    events(m_context);
    
    return m_screen;
  }
  protected final void changeScreen(Screen t_next){
    if(t_next != null){
      m_screen = t_next;
    } else {
      exit();
    }
  }
  protected final void setBackground(color t_color){
    fill(t_color);
    rect(0,0,width,height);
    fill(255);
  }
  protected final long frameCount(){
    return m_context.frameCount-m_startFrame;
  }
  protected final void resetFrameCount(){
    m_startFrame = m_context.frameCount;
  }
  protected final String title(){
    return m_title;
  }
  
  private final class Loader extends Thread {
    @Override
      public void start() {
      if(VERBOSITY) print("Loading '"+m_title+"'...");
      super.start();
    }
    @Override
      public void run() {
      load(m_context);
      m_ready=true;
      m_startFrame = m_context.frameCount;
      println("Finish!");
    }
  }
}