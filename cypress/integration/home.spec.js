describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/')
  })
  it("should visit homepage", () => {
    cy.get("footer").should("have.class", "py-3")
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})