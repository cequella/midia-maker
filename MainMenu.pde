class MainMenu extends Screen {
  final int LOGO_SIZE   = 100;
  final int LOGO_SPEED  = 5;

  private PImage m_logo;
  private Card[] m_card;
  private TopBar m_topBar;

  private float  m_logoSize;
  private float  m_logoX, m_logoY;

  public MainMenu(PApplet t_context) {
    super(t_context, "Home");
    m_logoSize = LOGO_SIZE;
    m_logoX    = (width-m_logoSize)/2;
    m_logoY    = (height-m_logoSize)/2;
  }

  @Override protected void notReady(PApplet context) {
  }
  @Override protected void ready(PApplet context) {
    // Draw Logo
    image(m_logo, m_logoX, m_logoY, m_logoSize, m_logoSize);
    if (m_logoX < (4.0*width-3.0*LOGO_SIZE)/6.0) {
      m_logoX += LOGO_SPEED;
      return;
    }

    // Draw Icons
    for (int i=0; i<m_card.length; i++) {
      m_card[i].draw();
    }
    
    //Draw Top bar
    m_topBar.draw();
  }
  @Override protected void load(PApplet context) {
    m_logo = loadImage(StrResource.logo);
    m_card = new Card[4];

    // Create menu options
    final String[] label = new String[]{"Vídeo", "Slide", "Site/Blog", "RedeSocial"};
    final float cardHeight = (height-TopBar.BAR_HEIGHT)/m_card.length;
    for (int i=0; i<m_card.length; i++) {
      m_card[i] = new Card(context, 
                            0,         i*cardHeight+TopBar.BAR_HEIGHT, 
                            width/3.0, cardHeight);

      m_card[i].paint(Palette.main_dark)
        .label(label[i])
        .icon("assets/icon-web.png")
        .iconSize(50.0)
        .roundness(0);
    }
    
    //Top bar
    m_topBar = new TopBar(context, title());
  }
  @Override protected void events(PApplet context) {
  }
}