Feature: Booking

  Background:
    Given I am on Booking screen

  Scenario: Create booking
    When I enter booking details
      And I save booking
    Then new booking should be created

  Scenario: Delete booking
    Given I have created booking
    When I delete booking
    Then booking should be deleted
