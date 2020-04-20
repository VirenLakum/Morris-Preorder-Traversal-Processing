BinaryTree mytree = new BinaryTree();

void setup()
{
  size(800, 800);
  background(150);
  textSize(32);
  textAlign(CENTER);
  
  frameRate(25);
  
  mytree.add(5);
  mytree.add(10);
  mytree.add(2);
  mytree.add(9);
  mytree.add(1);
  mytree.add(6);
  mytree.morrisPreorderTraversal();
}

void draw()
{
  noLoop();
}
