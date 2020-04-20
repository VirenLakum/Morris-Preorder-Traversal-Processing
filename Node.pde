class Node
{
  private float posX;
  private float posY;
  private Node left;
  private Node right;
  private int value;
  
  public Node(int value)
  {
    this.value = value;
  }
  
  void setPosition(PVector pos)
  {
    posX = pos.x;
    posY = pos.y;
    draw();
  }
  
  void draw()
  { //<>//
    fill(0);
    rect(posX, posY, 100, 50);
    stroke(255);
    strokeWeight(5);
    fill(255);
    line(posX+20, posY, posX+20, posY+50);
    line(posX+80, posY, posX+80, posY+50);
    fill(255);
    text(value, posX+50, posY+35);
    fill(255);
    if (left != null)
    {
      PVector leftPos = left.getPosition();
      line(posX, posY+50, leftPos.x+50, leftPos.y);
    }
    if (right != null)
    {
      PVector rightPos = right.getPosition();
      line(posX+100, posY+50, rightPos.x+50, rightPos.y);
    }
  }
  
  public void setLeft(Node n)
  {
    left = n;
    draw();
  }
  
  public void setRight(Node n)
  {
    right = n;
    draw();
  }
  
  public PVector getPosition()
  {
    return new PVector(posX, posY);
  }
}
