import java.util.ArrayList;
import java.util.List;

class BinaryTree
{
  private Node root;
  private Node currentNode;
  private List<Node> allNodes = new ArrayList<Node>();
  
  public BinaryTree()
  {
     //<>//
  }
  
  public void updateCurrentNode(Node n)
  {
    currentNode = n;
    draw();
  }
  
  private Node _add(Node currentNode, Node newNode)
  {
    if (currentNode == null)
      return newNode;
    
    if (currentNode.value > newNode.value)
    {
      newNode.setPosition(currentNode.getPosition().add(new PVector(-100, 100)));
      currentNode.setLeft(_add(currentNode.left, newNode));
    } 
    else if (currentNode.value < newNode.value)
    {
      newNode.setPosition(currentNode.getPosition().add(new PVector(100, 100)));
      currentNode.setRight(_add(currentNode.right, newNode));
    }
    return currentNode;
  }
  
  public void add(int value)
  { //<>//
    Node newNode = new Node(value);
    root = _add(root, newNode);
    allNodes.add(newNode);
    root.setPosition(new PVector(width/2, width/2 - 200));
    draw();
  }
  
  private void _print(Node currentNode)
  {
    if (currentNode == null)
      return;
      
    _print(currentNode.left);
    println(currentNode.value + " " + currentNode.posX + ", " + currentNode.posY);
    _print(currentNode.right);
  }
  
  public void print()
  {
    _print(root);
  }
  
  public void _MorrisPreorderTraversal()
  {
    while (currentNode != null)
    {
      // if currentNode->left is null
      // print currentNodes value and make currentNode as its right node
      if (currentNode.left == null)
      {
        println(currentNode.value);
        updateCurrentNode(currentNode.right);
      }
      else
      {
        //find predecessor
        Node predecessor = currentNode.left;
        while(predecessor.right != null && predecessor.right != currentNode)
          predecessor = predecessor.right;
          
        // If the right child of inorder predecessor already points to  
        // this currentNode  
        if (predecessor.right == currentNode)  
        {  
            predecessor.setRight(null);  
            updateCurrentNode(currentNode.right);  
        }
        // If right child doesn't point to this node, then print this  
        // node and make right child point to this node  
        else
        {  
          println(predecessor.value);  
          predecessor.setRight(currentNode);
          updateCurrentNode(currentNode.left);
        }
      }
    }
  }
  
  public void morrisPreorderTraversal()
  {
    updateCurrentNode(root);
    _MorrisPreorderTraversal();
  }
  
  
  private void morrisSetup()
  {
    textSize(20);
    fill(0);
    rect(10, 10, 150, 50);
    fill(255);
    text("currentNode", 80, 45);
    textSize(32);
  }
  
  void draw()
  { //<>//
    background(150);
    for (int i=0; i < allNodes.size(); i++)
    {
      allNodes.get(i).draw();
    }
    morrisSetup();
    stroke(0,128,0);
    if (currentNode != null)
    {
      PVector nodePos = currentNode.getPosition();
      line(85, 60, nodePos.x+50, nodePos.y);
      stroke(255);
    }
    
    delay(1000);
  }
}
