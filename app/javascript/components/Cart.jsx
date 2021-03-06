import React from "react";
import PropTypes from "prop-types";
import CartItem from "./CartItem";
import { saveOrder, subtotal, submitOrder } from "./helpers";

class Cart extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {}

  componentWillUnmount() {
    console.log('Unmounting!');
    saveOrder(cart);
  }

  render() {
    const items = this.props.cart.map((item) => {
      return (
        <CartItem
          id={item.id}
          key={item.id}
          imageUrl={item.imageUrl}
          name={item.name}
          cart={this.props.cart}
          setCart={this.props.setCart}
          unitPriceCents={item.price_cents}
          quantity={item.quantity}
          incrementItem={this.props.incrementItem}
          decrementItem={this.props.decrementItem}
        />
      );
    });
    return (
      <>
        <h3>YOUR ORDER</h3>
        <br />
        {this.props.cart.length ? (
          <>
            <table>
              <thead>
                <tr>
                  <th>Dish</th>
                  <th>Unit price</th>
                  <th>Quantity</th>
                  <th>Total price</th>
                </tr>
              </thead>
              <tbody>{items}</tbody>
              <tfoot>
                <tr>
                  <td colSpan="3">TOTAL</td>
                  <td>{subtotal(this.props.cart)}</td>
                </tr>
              </tfoot>
            </table>
            <button
              className="convert-button"
              onClick={() => submitOrder(this.props.cart)}
            >
              Order Now
            </button>
            <button className="cancel" onClick={() => {
              this.props.setCart([]);
              saveOrder([]);
            }}>
              Cancel Order
            </button>
          </>
        ) : (
          <p>Click "Add" above to start adding dishes to your order!</p>
        )}
      </>
    );
  }
}

Cart.propTypes = {
  decrementItem: PropTypes.func,
  incrementItem: PropTypes.func,
  cart: PropTypes.array,
  setCart: PropTypes.func,
};

export default Cart;
