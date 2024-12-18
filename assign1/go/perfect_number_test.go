package perfect_number

import (
	"fmt"
	"testing"
)

func TestCanary(t *testing.T) {
	if true != true {
		t.Errorf("The canary test failed. This should never happen.")
	}
}

func TestIsPerfectNumberImperative(t *testing.T) {
	tests := []struct {
		input    int
		expected bool
	}{
		{6, true},
		{28, true},
		{496, true},
		{12, false},
		{1, false},
		{0, false},
	}

	for _, test := range tests {
		result := IsPerfectNumberImperative(test.input)

		if result != test.expected {
			t.Errorf("IsPerfectNumber(%d) = %v; want %v", test.input, result, test.expected)
			continue
		}

		t.Log(fmt.Sprintf("IsPerfectNumberImperative(%d) = %v", test.input, result))
	}
}

func TestIsPerfectNumberFunctional(t *testing.T) {
	tests := []struct {
		input    int
		expected bool
	}{
		{6, true},
		{28, true},
		{496, true},
		{12, false},
		{1, false},
		{0, false},
	}

	for _, test := range tests {
		result := IsPerfectNumberFunctional(test.input)

		if result != test.expected {
			t.Errorf("IsPerfectNumber(%d) = %v; want %v", test.input, result, test.expected)
			continue
		}

		t.Log(fmt.Sprintf("IsPerfectNumberFunctional(%d) = %v", test.input, result))
	}
}
