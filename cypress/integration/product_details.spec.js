describe('Jungle test', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  it("should visit homepage", () => {
    cy.get("footer").should("have.class", "py-3")
  })

  it("should visit product details", async () => {
    cy.get('.products').children().first().click()
    .should("have.class", 'product-detail')
     
  })
  
})