describe('Jungle test', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  it("should visit homepage", () => {
    cy.get("footer").should("have.class", "py-3")
  })

  it("should visit signup", () => {
    cy.visit('/signup')
    cy.get('main > h1').should("have.text", "Signup!")
    cy.get('input').eq(0).type("wesley")
    cy.get('input').eq(1).type("wei")
    cy.get('input').eq(2).type("wesley@wei.ca")
    cy.get('input').eq(3).type("wesleywei")
    cy.get('input').eq(4).type("wesleywei")
    cy.get("[value='Submit']").click()
    cy.visit('/')
    cy.get('p').first().contains('Looking')
     
  })
  
})