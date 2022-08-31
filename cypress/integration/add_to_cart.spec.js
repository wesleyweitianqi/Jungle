describe('Jungle test', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  it("should visit homepage", () => {
    cy.get("footer").should("have.class", "py-3")
  })

  it("should see count change", () => {
    cy.get('.btn').first().click({force: true})
    cy.url().get('.end-0').contains('1')
  })
})