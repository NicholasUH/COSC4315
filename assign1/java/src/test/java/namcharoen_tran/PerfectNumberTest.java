package namcharoen_tran;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;

public class PerfectNumberTest {

  @Test
  public void canaryTest() {
    assertTrue(true);
  }

  @ParameterizedTest
  @ValueSource(ints = { 6, 28, 496 })
  public void testIsPerfectNumberTrue(int number) {
    assertTrue(PerfectNumber.isPerfectNumberImperative(number));
  }

  @ParameterizedTest
  @ValueSource(ints = { 5, 12, 8129, 1, -1, 0 })
  public void testIsPerfectNumberFalse(int number) {
    assertFalse(PerfectNumber.isPerfectNumberImperative(number));
  }

  @ParameterizedTest
  @ValueSource(ints = { 6, 28, 496 })
  public void testIsPerfectNumberFunctionalTrue(int number) {
    assertTrue(PerfectNumber.isPerfectNumberFunctional(number));
  }

  @ParameterizedTest
  @ValueSource(ints = { 5, 12, 8129, 1, -1, 0 })
  public void testIsPerfectNumberFunctionalFalse(int number) {
    assertFalse(PerfectNumber.isPerfectNumberFunctional(number));
  }
}
