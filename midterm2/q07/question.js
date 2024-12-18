//Given this JavaScript code:

var employment = { 
  salary: 100,
  bonus: function() {
    this.salary *= 1.2;
  }  
}

class Person {}

const jill = new Person();
const jack = new Person();

Object.setPrototypeOf(jill, employment);
Object.setPrototypeOf(jack, employment);

console.log(Object.getPrototypeOf(jill) === Object.getPrototypeOf(jack)); // true

console.log(jill.salary); // 100
console.log(jack.salary); // 100

jill.bonus();

console.log(jill.salary); // 120
console.log(jack.salary); // 100

//The first console.log shows that both the objects, jill and jack,
//share the prototype. The values for salary for each are the same as well,
//initially. But, when the bonus function sets the salary, it changed only for
//the object jill and not for the object jack. Why is that? Explain.

/*
JavaScript uses prototypal inheritance, where objects inherit properties and methods from a shared prototype. In this example, both Jill and Jack share the same prototype, employment, which is why the salary property initially appears the same for both objects. However, when the bonus method is called on Jill, their salaries are now different due to the way JavaScript handles property access and assignment in the context of prototypes. 

Due to the nature of prototypal inheritance, gets (property access) are deep and traverse the prototype chain, while sets (property assignment) are shallow and apply only to the object on which the operation is performed because they do not go through the prototype chain.

When you access a property (e.g. jill.salary), JavaScript traverses the prototype chain to find the property if it doesn't exist on the object itself. This is why both Jill and Jack initially displayed the same salary from their shared prototype. 

However, when Jill's salary value is updated, JavaScript assigns a new property salary directly on Jill, making it an own property that shadows the prototype's salary. Even with this change, the prototype remains unchanged so Jack still has the original salary value of 100. This explains why the salary property can be different even on objects with the same prototype.
*/

Total[10]: 10
