import { connect } from 'react-redux';
import { addApple, addOrange, addPears, clearFruit } from '../actions';
import FruitStand from './fruit_stand';

const mapStateToProps = state => ({
  fruits: state.fruits
});

const mapDispatchToProps = dispatch => ({
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  addPears: () => dispatch(addPears()),
  clearFruit: () => dispatch(clearFruit())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
