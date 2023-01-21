import React from "react";
import { CloseCircleOutlined, CheckOutlined } from "@ant-design/icons";
import { Typography } from "antd";
import { useState } from "react";
import { Note, Priority } from "../../../../types";

type IItem = {
  item: Note;
};
function CardItem(props: IItem) {
  const [check, setCheck] = useState(false);
  const {
    item: { id, name, state, priority },
  } = props;

  const handleClickCheck = () => {
    setCheck(!check);
  };

  const isCompleted = () => {
    return state === "completed";
  };

  const isNonePriority = () => {
    return priority === "none";
  };

  const colorPriority: {
    [key in Priority]: { text: string; bg: string; border: string };
  } = {
    high: {
      bg: "#FFF1EF",
      text: "#FA8288",
      border: "#FFCAC5",
    },
    medium: {
      bg: "#F8F3FD",
      text: "#B594E6",
      border: "#EEE2FC",
    },
    low: {
      bg: "#E5F7FF",
      text: "#5BB2FF",
      border: "#BDE6FE",
    },
    none: {
      bg: "#6d8fec",
      text: "#ffffff",
      border: "#ffff",
    },
  };

  return (
    <div className="w-full h-[100px] bg-white rounded-lg shadow-sm flex ">
      <div className="mt-2 ml-3">
        <CloseCircleOutlined className="opacity-50 font-bold" />
      </div>

      <div className="mx-4 my-1 w-[70%]">
        <Typography className=" text-base font-semibold">{name}</Typography>
        <Typography className="font-semibold opacity-50 text-[13px] mb-3">
          Home
        </Typography>

        {!isNonePriority() && (
          <div
            className={`rounded-md border-solid	border`}
            // NOTE: tailwind sucks and not working well with bg dynamic
            style={{
              background: colorPriority[priority].bg,
              borderColor: colorPriority[priority].border,
              display: "inline-block",
            }}
          >
            <div
              // NOTE: tailwind sucks and not working well with text color dynamic
              style={{
                color: colorPriority[priority].text,
              }}
              className={`font-normal text-[13px] py-1 px-2  text-center `}
            >
              {priority}
            </div>
          </div>
        )}
      </div>

      <div className="mt-2 mr-3">
        <div
          className={`h-[14px] w-[14px]  border-solid	border-1 
         flex justify-center items-center rounded-[0.25rem] ${
           isCompleted() ? `bg-[#71BAFC] border-[#71BAFC]` : `border-[#EAEAEA]`
         }`}
          onClick={handleClickCheck}
        >
          {isCompleted() && (
            <>
              <CheckOutlined className="text-[13px] text-[white]" />
            </>
          )}
        </div>
      </div>
    </div>
  );
}

export default CardItem;
