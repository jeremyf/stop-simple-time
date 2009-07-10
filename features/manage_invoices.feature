Feature: Manage invoices
  In order to receive payment
  As a contract worker
  I want to create an invoice with line-items
  
  Scenario: Register new invoice
    Given the following entries:
      |description | spent_on   | hours_spent |
      |Ticket #1   | 2009-01-01 | 0.50        |
      |Ticket #2   | 2009-01-02 | 0.75        |
      |Ticket #3   | 2038-01-01 | 1.10        |
    And I am on the new invoice page
    When I press "Create"
    Then the new invoice should have 2 entries

  # Scenario: Delete invoice
  #   Given the following invoices:
  #     ||
  #     ||
  #     ||
  #     ||
  #     ||
  #   When I delete the 3rd invoice
  #   Then I should see the following invoices:
  #     ||
  #     ||
  #     ||
  #     ||
