import React from "react";
import PropTypes from "prop-types";
import CategoryItem from "./CategoryItem";

class Categories extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const categories = this.props.data.map((category) => {
      return (
        <CategoryItem
          id={category.id}
          key={category.id}
          selectedId={this.props.category}
          setCategory={this.props.setCategory}
          text={category.name}
        />
      );
    });

    return (
      <ul>
        <CategoryItem
          id={0}
          key={0}
          selectedId={this.props.category}
          setCategory={this.props.setCategory}
          text="All"
        />
        {categories}
      </ul>
    );
  }
}

Categories.propTypes = {
  data: PropTypes.array,
  category: PropTypes.number,
  setCategory: PropTypes.func
};

export default Categories;
