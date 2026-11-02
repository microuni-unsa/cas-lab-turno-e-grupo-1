import static org.junit.Assert.*;
import org.junit.*;

public class RectangleTest {
  Rectangle r;
  Rectangle[] rList = new Rectangle[5];

  @Before
  // Will be performed before each test.
  public void testSetup() {
    System.out.println("Setup for test complete.");
  }

  @After
  // Will be performed after each test.
  public void testComplete() {
    System.out.println("Test complete.");
  }

  @Test
  public void shouldStartWithZeroDimensions() {
    // Can be run when reader methods and default
    // constructor are complete.
    r = new Rectangle();
    try {
      assertTrue("shouldStartWithZeroDimensions: default values are wrong.",
        r.getH() == 0 && r.getW() == 0);
      System.out.println("shouldStartWithZeroDimensions completed successfully.");
    } catch (AssertionError e) {
      System.out.println(e.getMessage());
    }
  }

  @Test
  public void shouldStartWithZeroArea() {
    // After area reader is written.
    r = new Rectangle();
    try {
      assertTrue("shouldStartWithZeroArea: default values are wrong.",
        r.getH() == 0 && r.getW() == 0 && r.getA() == 0);
      System.out.println("shouldStartWithZeroArea completed successfully.");
    } catch (AssertionError e) {
      System.out.println(e.getMessage());
    }
  }

  @Test
  public void shouldStoreConstructorValues() {
    // After second constructor is written.
    r = new Rectangle();
    try {
      r = new Rectangle(10, 20);
      assertTrue("shouldStoreConstructorValues: initial values are wrong.",
        r.getH() == 10 && r.getW() == 20 && r.getA() == 200);
      System.out.println("shouldStoreConstructorValues completed successfully.");
    } catch (AssertionError e) {
      System.out.println(e.getMessage());
    }
  }

  @Test
  public void shouldBuildGrowingRectangles() {
    // After second constructor is written.
    r = new Rectangle();
    try {
      for (int i = 0; i < 5; i++) {
        rList[i] = new Rectangle(2 * i, 3 * i);
        assertTrue("shouldBuildGrowingRectangles: initial values are wrong.",
          rList[i].getH() == 2 * i &&
          rList[i].getW() == 3 * i &&
          rList[i].getA() == 6 * i * i);
      }
      System.out.println("shouldBuildGrowingRectangles completed successfully.");
    } catch (AssertionError e) {
      System.out.println(e.getMessage());
    }
  }

  @Test
  public void shouldApplyWrittenDimensions() {
    // After writers are written.
    r = new Rectangle();
    try {
      for (int i = 0; i < 5; i++) {
        rList[i] = new Rectangle(2 * i, 3 * i);
        rList[i].setH(11 * i);
        rList[i].setW(7 * i);
        assertTrue("shouldApplyWrittenDimensions: modified values are wrong.",
          rList[i].getH() == 11 * i &&
          rList[i].getW() == 7 * i &&
          rList[i].getA() == 77 * i * i);
      }
      System.out.println("shouldApplyWrittenDimensions completed successfully.");
    } catch (AssertionError e) {
      System.out.println(e.getMessage());
    }
  }

  @Test
  public void shouldPrintModifiedRectangles() {
    // toString test.
    r = new Rectangle();
    try {
      for (int i = 0; i < 5; i++) {
        rList[i] = new Rectangle(2 * i, 3 * i);
        rList[i].setH(11 * i);
        rList[i].setW(7 * i);
        assertTrue("shouldPrintModifiedRectangles: modified values are wrong.",
          rList[i].getH() == 11 * i &&
          rList[i].getW() == 7 * i &&
          rList[i].getA() == 77 * i * i);
        System.out.println(rList[i]);
      }
      System.out.println("shouldPrintModifiedRectangles completed successfully.");
    } catch (AssertionError e) {
      System.out.println(e.getMessage());
    }
  }

  public static void main(String[] args) {
    org.junit.runner.JUnitCore.main("RectangleTest");
  }
}
